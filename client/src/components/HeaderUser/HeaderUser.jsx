import React from "react";
import AuthStatus from "../AuthStatus/AuthStatus";
import logo_babybump from "../../assets/logo_babybump.png";
import AccountCircleIcon from "@mui/icons-material/AccountCircle";
import './HeaderUser.css'

const HeaderUser = ({user}) => {

  return (
    <div className="header-user-container">
      <div className="logo">
        <img src={logo_babybump} alt="Logo BabyBump"></img>
      </div>
      <div className="profile-info">
        <div className="profile-photo">
          {user?.photo_url ? (
            <img src={user.photo_url} alt="Profile"></img>
          ) : (
            <AccountCircleIcon sx={{ fontSize: "100px" }} />
          )}
        </div>
        <AuthStatus />
      </div>
    </div>
  );
};

export default HeaderUser;
