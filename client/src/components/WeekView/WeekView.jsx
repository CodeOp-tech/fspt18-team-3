import { useEffect, useState } from "react";
import logo_babybump from "../../assets/logo_babybump.png";
import "./WeekView.css";
import AuthStatus from "../AuthStatus/AuthStatus";
import DisplayWeekInfo from "../DisplayWeek/DisplayWeekInfo";
import { getUser, countWeeks } from "../../services/pregnancyService";

const WeekView = () => {
  const [user, setUser] = useState();

  useEffect(() => {
    const fetchData = async () => {
      try {
        const user = await getUser();
        setUser(user);
      } catch (error) {
        console.error("Error fetching data:", error);
      }
    };

    fetchData();
  }, []);

  return (
    <div className="info-weeks-view">
      <AuthStatus className="logoutButton"/>
      <img src={logo_babybump} className="logo" alt="App logo" />
      {user ? (
        <>
          <p className="user-greeting">¡Hola {user.user_name}!</p>
          <p className="user-info">
            {user.baby_name} ya tiene {countWeeks(user)} semanas.
          </p>
        </>
      ) : (
        <></>
      )}
      <DisplayWeekInfo user={user} />
    </div>
  );
};

export default WeekView;
