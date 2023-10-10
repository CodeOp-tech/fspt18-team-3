import { useEffect, useState } from "react";
import "./ViewProfilePage.css";
import { Link as RouterLink } from "react-router-dom";
import Button from "@mui/material/Button";
import Gallery from "../Gallery/Gallery.jsx";
import HeaderUser from "../HeaderUser/HeaderUser";
import {
  getUser,
  countWeeks,
  countWeeksLeft,
} from "../../services/pregnancyService";

const ViewProfilePage = () => {
  const [user, setUser] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const user = await getUser();
        setUser(user);
      } catch (error) {
        console.error("Error fetching user or photos:", error);
      }
    };

    fetchData();
  }, []);

  const getWeekId = (user) => {
    return countWeeks(user) - 2;
  };
  if (!user) {
    return null;
  }
  console.log(user)
  return (
    <div className="view-profile-container">
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
        <Button component={RouterLink} to="/edit" variant="outlined" type="button"> 
          Editar
        </Button>
      </div>
      <Gallery userId={user.id} weekId={getWeekId(user)} />
    </div>
    </div>
  );
};

export default ViewProfilePage;
