import { useEffect, useState } from "react";
import img1 from "../../images/img1.jpg";
import img2 from "../../images/img2.jpg";
import img3 from "../../images/img3.jpg";
import Button from "@mui/material/Button";
import { useRouteLoaderData } from "react-router-dom";
import axios, {isCancel, AxiosError} from 'axios';

const Gallery = ({userId, weekId}) => {
  const [selectedFile, setSelectedFile] = useState(null);
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
    getPhotos(userId); 
    
  }, []); 

  const onFileChange = (event) => {
    setSelectedFile(event.target.files[0]);
  };


  /*const onFileChange = (event) => {
    setSelectedFile({
      name: event.target.files[0],
      photo_description: "",
      date_posted:new Date().toISOString().slice(0, 10)
    });
  };*/

  const onFileUpload = async() =>{
    const formData = new FormData();
    formData.append("photofile", selectedFile, selectedFile.name);

    try{
      const res = await axios.post(`http://localhost:5000/photos/${userId}/${weekId}`, formData,{
        headers:{
          "Content-Type":"multipart-form/data",
        }
      });
      console.log(res);
      getPhotos(userId);
    }catch(err){
      console.log(err);
    }
  }

  const getPhotos = async(userId) => {
    try{
      const res = await axios.get(`http://localhost:5000/photos/${userId}`)
      setImages(res.data);
    }catch(err){
      console.log(err)
    }
  }

  return (
    <div>
      <div className="profile-galery">
        <h3>Galería de mi embarazo</h3>
        <div className="profile-grid">
          {images.map((image) => (
            <div className="profile-grid-item" key={image.id}>
              <img src={`http://localhost:5000/photos/${image.path}`}></img>
            </div>
          ))}
        </div>
        <Button variant="outlined" type="button">
          Añade otra imagen
        </Button>
      </div>
      <div>
        <input type="file" onChange={onFileChange}/>
        <button onClick={onFileUpload}>Subir</button>
      </div>
    </div>
  );
};

export default Gallery;


