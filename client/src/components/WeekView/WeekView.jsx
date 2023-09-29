// eslint-disable-next-line no-unused-vars
import React, { useEffect, useState } from 'react';
import logo_babybump from "../../assets/logo_babybump.png";
import "./WeekView.css";

// eslint-disable-next-line react/prop-types
const WeekView = ({/* userName, babyName, weeks*/}) => {
  const [user, setUser] = useState("")
  const [symptom, setSymptoms] = useState([{
    "id":1,
    "week_id": 3,
    "symptom_name": "Hello",
    "symptom_description": "You are welcome."

  }])
  const [advice, setAdvice] = useState([{
    "id": 1,
    "week_id": 3,
    "advice_description": "You are welcome."

  }])
  const [weeks, setWeeks] = useState("")
  let weekId = 0
  let currentWeek = 0

  useEffect(() => {
    getUser();
  },[])

  const countWeeks = (user) =>{
    const dateToday = new Date().toISOString().slice(0,10);
    const simpleDate = new Date(dateToday)
    const creationDate = new Date(user.creation_date)
    
    const weeksAdded = (simpleDate-creationDate)/(1000*60*60*24*7)
  
    const result = weeksAdded + user.weeks_pregnant
  
    currentWeek = Math.round(result)
    
   return  Math.round(result)
  }
  
  const getWeekId = (user) =>{
  
    weekId = countWeeks(user) - 2
    return weekId
  }

  const getUser = async () => {
 
    fetch(`http://localhost:5000/users/user/1`)//----->${user.id}
    .then(response => response.json())
    .then(user =>{
        setUser(user[0]);
        getWeeks(user[0]);
        getSymptoms(user[0]);
        getAdvice(user[0]);
      })
    .catch(err =>
        setError(err))
}

const getWeeks = async (user) => {

  fetch(`http://localhost:5000/weeks/${getWeekId(user)}`)
  .then(response => response.json())
  .then(week =>
      setWeeks(week[0])
  )
  .catch(err =>
      setError(err))
}

const getSymptoms = async (user) =>{

  fetch(`http://localhost:5000/weeks/${getWeekId(user)}/symptoms`)
    .then(response => response.json())
    .then(symptom =>
        setSymptoms(symptom)
    )
    .catch(err =>
        setError(err))
} 

const getAdvice = async (user) =>{

  fetch(`http://localhost:5000/weeks/${getWeekId(user)}/advice`)
    .then(response => response.json())
    .then(advice =>
        setAdvice(advice)
        )
    .catch(err =>
        setError(err))
}


  // Muestra la información de la semana seleccionada
  const displayWeekInfo = () => {
    // Aquí tengo que mostrar la información de la semana con selectedWeekInfo (de PregnancyForm)
    return (
      <div>
        {/* Muestra la información de la semana seleccionada */}
        <p>Semana {countWeeks(user)}: Desarrollo del bebé, tamaño, etc.</p>
        <img src={weeks.baby_image} alt={weeks.baby_size} />
        <h3>Tu bebé ya es del tamaño de {weeks.baby_size}</h3>

        <p>{weeks.baby_development}</p>

        <h3>Síntomas</h3>
        {symptom.map( symptom =>(
          <div key = {symptom.id}>
            <h4>{symptom.symptom_name}</h4>
            <p>{symptom.symptom_description}</p>
          </div>
        ))}
        <h3>Consejos</h3>
        {advice.map( advice =>(
          <div key = {advice.id}>
            <p>{advice.advice_description}</p>
          </div>
        ))}
      </div>
    );
  };

  return (
    <div className='info-weeks-view'>
      <img src={logo_babybump} className="logo" alt="App logo" />
      <p>¡Hola {user.user_name}!</p>
      <p>
        {user.baby_name} ya tiene {countWeeks(user)} semanas.
      </p>
      {displayWeekInfo()} {/* Llama a la función para mostrar la información de la semana */}
    </div>
  );
};

export default WeekView;