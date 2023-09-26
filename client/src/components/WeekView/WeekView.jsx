// eslint-disable-next-line no-unused-vars
import React from 'react';
import logo_babybump from "../../assets/logo_babybump.png";
import "./WeekView.css";

// eslint-disable-next-line react/prop-types
const WeekView = ({ userName = "Pepita", babyName = "Nael", weeks = 4 }) => {
  // Muestra la información de la semana seleccionada
  const displayWeekInfo = () => {
    // Aquí tengo que mostrar la información de la semana con selectedWeekInfo (de PregnancyForm)
    return (
      <div>
        {/* Muestra la información de la semana seleccionada */}
        <p>Semana {weeks}: Desarrollo del bebé, tamaño, etc.</p>
        <img src="ruta de imagen cloudinary" alt="Imagen de la semana" />
        <p>Aquí iría el texto que cogería de la API.</p>
      </div>
    );
  };

  return (
    <div className='info-weeks-view'>
      <img src={logo_babybump} className="logo" alt="App logo" />
      <p>¡Hola {userName}!</p>
      <p>
        {babyName} ya tiene {weeks} semanas.
      </p>
      {displayWeekInfo()} {/* Llama a la función para mostrar la información de la semana */}
    </div>
  );
};

export default WeekView;