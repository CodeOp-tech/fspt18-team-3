import { useEffect, useState } from "react";
import "./ViewProfilePage.css";
import img1 from "../../images/img1.jpg";
import img2 from "../../images/img2.jpg";
import img3 from "../../images/img3.jpg";
import { Link as RouterLink } from "react-router-dom";
import Button from "@mui/material/Button";
import axios from "axios";
import { getUser, countWeeks, countWeeksLeft } from "../../services/pregnancyService";
import HeaderUser from "../HeaderUser/HeaderUser";

const ViewProfilePage = () => {
  const [user, setUser] = useState();
  const [selectedFile, setSelectedFile] = useState({
    name: "",
    photo_description: "",
    date_posted: "",
  });
  const [images, setImages] = useState([
    {
      id: 1,
      image: img1,
    },
    {
      id: 2,
      image: img2,
    },
    {
      id: 3,
      image: img3,
    },
  ]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const user = await getUser();
        setUser(user);
        await getPhotos();
      } catch (error) {
        console.error("Error fetching user or photos:", error);
      }
    };
  
    fetchData();
  }, []);

  const onFileChange = (event) => {
    setSelectedFile({
      name: event.target.files[0],
      photo_description: "",
      date_posted: new Date().toISOString().slice(0, 10),
    });
  };

  const onFileUpload = async () => {
    const formData = new FormData();
    formData.append("photofile", selectedFile, selectedFile.name);

    try {
      const res = await axios.post(`/photos/${user_id}/${week_id}`, formData, {
        headers: {
          "Content-Type": "multipart-form/data",
        },
      });
      console.log(res);
      getPhotos();
    } catch (err) {
      console.log(err);
    }
  };

  const getPhotos = async () => {
    try {
      const res = await axios.get("/photos");
      setImages(res.data);
    } catch (err) {
      console.log(err);
    }
  };

  return (
    <div>
      <div className="profile-text">
        <HeaderUser user={user} />
        <div className="profile-info">
          {user ? <h2>{user.user_name}</h2> : <h2>Desconocido</h2>}
          <p>Tu bebé ya tiene {countWeeks(user)} semanas.</p>
          <p>Quedan aproximadamente {countWeeksLeft(user)} para tu parto.</p>
        </div>
        <div className="profile-buttons">
          <Button variant="outlined" component={RouterLink} to="/week-view">
            Saber más sobre mi embarazo
          </Button>
          <Button variant="outlined" type="button" component={RouterLink} to="/edit">
            Editar
          </Button>
        </div>
      </div>
      <div className="profile-galery">
        <h3>Galería de mi embarazo</h3>
        <div className="profile-grid">
          {images?.map((image) => (
            <div className="profile-grid-item" key={image.id}>
              <img src={`/photos/${image.path}`}></img>
            </div>
          ))}
        </div>
        <Button variant="outlined" type="button" className="MuiButton-addImage">
          Añade otra imagen
        </Button>
      </div>
      <div>
        <input type="file" onChange={onFileChange} />
        <button onClick={onFileUpload}>Subir</button>
      </div>
    </div>
  );
};

export default ViewProfilePage;
