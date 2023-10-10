import { useEffect, useState } from "react";
import axios from "axios";
import "./Gallery.css";

const Gallery = ({ userId, weekId }) => {
  const [selectedFile, setSelectedFile] = useState(null);
  const [images, setImages] = useState([]);

  const uploadFileButtonStyle = {
    backgroundColor: "transparent",
    color: "rgb(81, 167, 144)",
    border: "none",
    borderRadius: "8px",
    padding: "8px",
    fontSize: "14px",
    textTransform: "uppercase",
    cursor: "pointer",
  };

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

  const onFileUpload = async () => {
    const formData = new FormData();
    formData.append("photofile", selectedFile, selectedFile.name);

    try {
      const res = await axios.post(
        `http://localhost:5000/photos/${userId}/${weekId}`,
        formData,
        {
          headers: {
            "Content-Type": "multipart-form/data",
          },
        }
      );
      console.log(res);
      getPhotos(userId);
    } catch (err) {
      console.log(err);
    }
  };

  const getPhotos = async (userId) => {
    try {
      const res = await axios.get(`http://localhost:5000/photos/${userId}`);
      if (res.data?.length) setImages(res.data);
    } catch (err) {
      console.log(err.message);
    }
  };

  return (
    <div>
      <div className="profile-galery">
        <h3>Galería de mi embarazo</h3>
        <div className="profile-grid">
          {images.map((image) => (
            <div className="profile-grid-item" key={image.id}>
              {image.path ? (
                <img src={`http://localhost:5000/photos/${image.path}`} />
              ) : (
                <img src={image.name} />
              )}
            </div>
          ))}
        </div>
      </div>
      <div>
        <input type="file" onChange={onFileChange} className="select-item-button"/>
        <button onClick={onFileUpload} className="button-upload">Subir</button>
      </div>
    </div>
  );
};

export default Gallery;
