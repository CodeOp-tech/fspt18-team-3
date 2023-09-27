import Login from "./routes/Login.jsx";
import Register from "./routes/Register.jsx";
import User from "./routes/User.jsx";
import ErrorPage from "./Error-page.jsx";
import Home from "./components/Home/Home.jsx";
import { Routes, Route, Navigate } from "react-router-dom";
import WeekView from "./components/WeekView/WeekView";

import ViewProfilePage from "./components/ViewProfilePage/ViewProfilePage";
// eslint-disable-next-line no-unused-vars
import React, {useState} from "react";

function App() {

  const authHandler = () => {

  }

  const signUpHandler = () => {
    
  }


  return (
    <Routes>
      <Route path="/" element={<Home /> } />
      <Route path="/week-view" element={<WeekView />} />
      <Route path="/login" element={<Login onLogin={authHandler}/>} />
      <Route path="/register" element={<Register onRegister={signUpHandler}/>} />
      <Route path="/user" element={<User />} />
      <Route path="*" element={<ErrorPage />} />
    </Routes>
  );
}

export default App;
