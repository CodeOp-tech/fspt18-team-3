import { useEffect, useState } from "react";
import logo_babybump from "../../assets/logo_babybump.png";
import "./ViewProfilePage.css";
import { Link as RouterLink } from "react-router-dom";
import Button from "@mui/material/Button";
import AccountCircleIcon from "@mui/icons-material/AccountCircle";
import { useRouteLoaderData } from "react-router-dom";
import Gallery from '../Gallery/Gallery.jsx'

const ViewProfilePage = () => {
  let userId = useRouteLoaderData("root");

  const [user, setUser] = useState("");

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
        setUser(user[0]),
        console.log(user[0])
        getWeekId(user)
        //getPhotos(user);
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  }

  const countWeeks = (user) => {
    const dateToday = new Date().toISOString().slice(0, 10);
    const simpleDate = new Date(dateToday);
    const creationDate = new Date(user.creation_date);
    const weeksAdded = (simpleDate - creationDate) / (1000 * 60 * 60 * 24 * 7);
    const result = weeksAdded + user.weeks_pregnant;
    return Math.round(result);
  };

  const countWeeksLeft = (user) => {
    return 40 - countWeeks(user);
  };

  const getWeekId = (user) => {
    return countWeeks(user) -2
  }

  return (
    
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
        <Gallery userId ={user.user_id} weekId={getWeekId(user)}/>
      </div>
     
    
  );
};

export default ViewProfilePage;


