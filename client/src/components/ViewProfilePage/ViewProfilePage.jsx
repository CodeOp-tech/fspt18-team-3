import { useEffect, useState } from "react";
import logo_babybump from "../../assets/logo_babybump.png";
import "./ViewProfilePage.css";
import img1 from "../../images/img1.jpg";
import img2 from "../../images/img2.jpg";
import img3 from "../../images/img3.jpg";
import { Link as RouterLink } from "react-router-dom";
import Button from "@mui/material/Button";
import AccountCircleIcon from "@mui/icons-material/AccountCircle";
import { useRouteLoaderData } from "react-router-dom";

const ViewProfilePage = () => {
  let userId = useRouteLoaderData("root");

  const [user, setUser] = useState("");
  const [selectedFile, setSelectedFile] = useState({
    name: "",
    photo_description: "",
    date_posted: ""
  })
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
    getUser(); 
    getPhotos()
  }, []); 

  async function getUser() {
    const token = localStorage.getItem("token");

    if (!token) {
      console.log("Access token not found in localStorage.");
    }

    fetch(`http://localhost:5000/users/user`, {
      method: "GET",
      headers: {
        Authorization: `Bearer ${token}`,
      },
    })
      .then((response) => {
        if (!response.ok) {
          throw new Error("Error retrieving the user");
        }
        return response.json();
      })
      .then((user) => {
        setUser(user[0]);
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  }

  const countWeeks = () => {
    const dateToday = new Date().toISOString().slice(0, 10);
    const simpleDate = new Date(dateToday);
    const creationDate = new Date(user.creation_date);
    const weeksAdded = (simpleDate - creationDate) / (1000 * 60 * 60 * 24 * 7);
    const result = weeksAdded + user.weeks_pregnant;
    return Math.round(result);
  };

  const countWeeksLeft = () => {
    return 40 - countWeeks();
  };

  const onFileChange = (event) => {
    setSelectedFile({
      name: event.target.files[0],
      photo_description: "",
      date_posted:new Date().toISOString().slice(0, 10)
    });
  };

  const onFileUpload = async() =>{
    const formData = new FormData();
    formData.append("photofile", selectedFile, selectedFile.name)

    try{
      const res = await axios.post(`/photos/${user_id}/${week_id}`, formData,{
        headers:{
          "Content-Type":"multipart-form/data",
        }
      });
      console.log(res);
      getPhotos();
    }catch(err){
      console.log(err);
    }
  }

  const getPhotos = async() => {
    try{
      const res = await axios.get("/photos")
      setImages(res.data);
    }catch(err){
      console.log(err)
    }
  }

  return (
    <div>
      <div className="profile-text">
        <div className="profile-logo-image__text">
          <div className="profile-logo">
            <img src={logo_babybump}></img>
          </div>
          <div className="profile-photo">
            {user ? (
              <img src={user.photo_url}></img>
            ) : (
              <AccountCircleIcon sx={{ fontSize: "100px" }} />
            )}
          </div>
        </div>
        <div className="profile-info">
          {user ? <h2>{user.user_name}</h2> : <h2>Desconocido</h2>}
          <p>Tu bebé ya tiene {countWeeks(user)} semanas.</p>
          <p>Quedan aproximadamente {countWeeksLeft(user)} para tu parto.</p>
        </div>
        <div className="profile-buttons">
          <Button variant="outlined" component={RouterLink} to="/week-view">
            Saber más sobre mi embarazo
          </Button>
          <Button variant="outlined" type="button">
            Editar
          </Button>
        </div>
      </div>
      <div className="profile-galery">
        <h3>Galería de mi embarazo</h3>
        <div className="profile-grid">
          {images.map((image) => (
            <div className="profile-grid-item" key={image.id}>
              <img src={`/photos/${images.path}`}></img>
            </div>
          ))}
        </div>
        <Button variant="outlined" type="button">
          Añade otra imagen
        </Button>
      </div>
      <div>
        <inptu type="file" onChange={onFileChange}/>
        <button onClick={onFileUpload}>Subir</button>
      </div>
    </div>
  );
};

export default ViewProfilePage;


