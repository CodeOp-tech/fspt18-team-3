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
          <p>Tu bebé ya tiene {countWeeks()} semanas.</p>
          <p>Quedan aproximadamente {countWeeksLeft()} para tu parto.</p>
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
              <img src={image.image}></img>
            </div>
          ))}
        </div>
        <Button variant="outlined" type="button">
          Añade otra imagen
        </Button>
      </div>
    </div>
  );
};

export default ViewProfilePage;
