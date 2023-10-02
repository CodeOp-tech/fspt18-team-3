import React, { useState, useEffect } from 'react';
import "./PregnancyForm.css";
import {useNavigate} from "react-router-dom"

const PregnancyForm = () => {
  const [formData, setFormData] = useState({ name: '', babyName: '', weeks: 0 });
  const [selectedWeekInfo, setSelectedWeekInfo] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    // Aquí tengo que implementar la lógica para cargar la información de la semana seleccionada desde la BBDD
    setSelectedWeekInfo// y almacenarla en selectedWeekInfo
  }, [formData.weeks]);

  const handleInputChange = (event) => {
    const { name, value } = event.target;
    setFormData({
      ...formData,
      [name]: value
    });
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    console.log('Nombre:', formData.name);
    console.log('Nombre del bebé:', formData.babyName);
    console.log('Semanas de embarazo:', formData.weeks);
    console.log('Información de la semana:', selectedWeekInfo);
    navigate(`/week-view/${formData.weeks}`);
  };

  return (
    <>
    <div className="card">
        <p>
          Descubre semana a semana cómo crece tu bebé y diviértete en esta etapa
          tan bonita
        </p>
      </div>
      <form onSubmit={handleSubmit}>
        <div>
          <label>
            Nombre:
            <input
              type="text"
              name="name"
              value={formData.name}
              onChange={handleInputChange}
            />
          </label>
        </div>
        <div>
          <label>
            Nombre de tu bebé (opcional):
            <input
              type="text"
              name="babyName"
              value={formData.babyName}
              onChange={handleInputChange}
            />
          </label>
        </div>
        <div>
          <label>
            ¿De cuántas semanas estás?
            <input
              type='number'
              name="weeks"
              min={4}
              max={40}
              value={formData.weeks}
              onChange={handleInputChange}
            />
            </label>
        </div>
        <button type="submit">Saber más sobre mi embarazo</button>
      </form>
    </>
  );
};

export default PregnancyForm;