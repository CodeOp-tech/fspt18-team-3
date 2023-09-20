// eslint-disable-next-line no-unused-vars
import React, { useState } from 'react';

const PregnancyForm = () => {
  const [name, setName] = useState('');
  const [nameBaby, setNameBaby] = useState('');
  const [weeks, setWeeks] = useState(0);

  const handleNameChange = (event) => {
    setName(event.target.value);
  };

  const handleNameBabyChange = (event) => {
    setNameBaby(event.target.value);
  };

  const handleWeeksChange = (event) => {
    setWeeks(event.target.value);
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    // A realizar cuando el endpoint esté disponible en el backend
    console.log('Nombre:', name);
    console.log('Nombre del bebé:', nameBaby);
    console.log('Semanas de embarazo:', weeks);
  };

  return (
    <form onSubmit={handleSubmit}>
      <div>
        <label>
          Nombre:
          <input type="text" value={name} onChange={handleNameChange} />
        </label>
      </div>
      <div>
        <label>
          Nombre de tu bebé (opcional):
          <input
            type="text"
            value={nameBaby}
            onChange={handleNameBabyChange}
          />
        </label>
      </div>
      <div>
        <label>
          ¿De cuántas semanas estás?
          <select value={weeks} onChange={handleWeeksChange}>
            {Array.from({ length: 45 }, (_, index) => (
              <option key={index} value={index}>
                {index}
              </option>
            ))}
          </select>
        </label>
      </div>
      <button type="submit">Saber más sobre mi embarazo</button>
    </form>
  );
};

export default PregnancyForm;