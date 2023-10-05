import { useEffect, useState } from "react";
import logo_babybump from "../../assets/logo_babybump.png";
import "./WeekView.css";

const WeekView = () => {
  const [expanded, setExpanded] = useState(false); // NUEVA LÍNEA

  const [user, setUser] = useState("");
  const [symptom, setSymptoms] = useState([
    {
      id: 1,
      week_id: 3,
      symptom_name: "Hello",
      symptom_description: "You are welcome.",
    },
  ]);
  const [advice, setAdvice] = useState([
    {
      id: 1,
      week_id: 3,
      advice_description: "You are welcome.",
    },
  ]);
  const [weeks, setWeeks] = useState("");

  let weekId = 0;

  useEffect(() => {
    getUser();
  }, []);

  const countWeeks = (user) => {
    const dateToday = new Date().toISOString().slice(0, 10);
    const simpleDate = new Date(dateToday);
    const creationDate = new Date(user.creation_date);
    const weeksAdded = (simpleDate - creationDate) / (1000 * 60 * 60 * 24 * 7);
    const result = weeksAdded + user.weeks_pregnant;
    return Math.round(result);
  };

  const getWeekId = (user) => {
    weekId = countWeeks(user) - 2;
    return weekId;
  };

  const options = () => {
    const token = localStorage.getItem("token");

    if (!token) {
      console.log("Access token not found in localStorage.");
      return;
    }
    return {
      method: "GET",
      headers: {
        Authorization: `Bearer ${token}`,
      },
    };
  };

  async function getUser() {
    fetch(`http://localhost:5000/users/user`, options())
      .then((response) => {
        if (!response.ok) {
          throw new Error("Error retrieving the user");
        }
        return response.json();
      })
      .then(async (user) => {
        setUser(user[0]);
        await Promise.all([
          getWeeks(user[0]),
          getSymptoms(user[0]),
          getAdvice(user[0]),
        ]);
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  }

  const getWeeks = async (user) => {
    fetch(`http://localhost:5000/weeks/${countWeeks(user)}`, options())
      .then((response) => response.json())
      .then((week) => {
        setWeeks(week[0]);
      })
      .catch(console.log);
  };

  const getSymptoms = async (user) => {
    fetch(`http://localhost:5000/weeks/${getWeekId(user)}/symptoms`, options())
      .then((response) => response.json())
      .then((symptom) => setSymptoms(symptom))
      .catch(console.log);
  };

  const getAdvice = async (user) => {
    fetch(`http://localhost:5000/weeks/${getWeekId(user)}/advice`, options())
      .then((response) => response.json())
      .then((advice) => setAdvice(advice))
      .catch(console.log);
  };

  const toggleExpanded = () => {
    // NUEVA LÍNEA
    setExpanded(!expanded); // NUEVA LÍNEA
  }; // NUEVA LÍNEA
  const displayWeekInfo = () => {
    return (
      <div>
        {/* Muestra la información de la semana seleccionada */}
        <div className="week-info">
            <p>Semana {countWeeks(user)}: Desarrollo del bebé, tamaño, etc.</p>
            <img
              src={weeks.baby_image}
              alt={weeks.baby_size}
              className="week-image"
            />
            <h3>Tu bebé ya es del tamaño de {weeks.baby_size}</h3>
            <div className={expanded ? "showFullContent" : "hideFullContent"}>
              <p>{weeks.baby_development}</p>
            </div>
            <button onClick={toggleExpanded} className="toggle-button">
              {expanded ? "Mostrar menos" : "Leer más"}
            </button>
          </div>

        <div className="symptom-container">
          <h3>Síntomas</h3>
          {symptom.map((symptom) => (
            <div key={symptom.id}>
              <p className="symptom-name">{symptom.symptom_name}</p>
              <p className="symptom-description">
                {symptom.symptom_description}
              </p>
            </div>
          ))}
        </div>

        <div className="advice-container">
          <h3>Consejos</h3>
          {advice.map((advice) => (
            <div key={advice.id}>
              <p className="advice-description">{advice.advice_description}</p>
            </div>
          ))}
        </div>
      </div>
    );
  };

  return (
    <div className="info-weeks-view">
      <img src={logo_babybump} className="logo" alt="App logo" />
      <p className="user-greeting">¡Hola {user.user_name}!</p>
      <p className="user-info">
        {user.baby_name} ya tiene {countWeeks(user)} semanas.
      </p>
      {displayWeekInfo()}{" "}
      {/* Llama a la función para mostrar la información de la semana */}
    </div>
  );
};

export default WeekView;
