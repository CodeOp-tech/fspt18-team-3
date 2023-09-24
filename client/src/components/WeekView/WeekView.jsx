// eslint-disable-next-line no-unused-vars
import React from 'react';
import logo_babybump from "../../assets/logo_babybump.png";
import "./WeekView.css";

// eslint-disable-next-line react/prop-types
const WeekView = ({ userName="Pepita", babyName="Nael", weeks=4 }) => {
  return (
    <div className='info-weeks-view'>
      <img src={logo_babybump} className="logo" alt="App logo" />
      <p>¡Hola {userName}!</p>
      <p>
        {babyName} ya tiene {weeks} semanas.
      </p>

      {/* Imagen */}
      <img src="ruta de imagen cloudinary" alt="Imagen de la semana" />

      {/* Texto */}
      <p>
        Aquí iría el texto que cogería de la API.
      </p>
    </div>
  );
};

export default WeekView;