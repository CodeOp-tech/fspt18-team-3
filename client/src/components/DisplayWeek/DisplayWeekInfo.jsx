import React, { useState, useEffect } from "react";
import {
  getSymptoms,
  getAdvice,
  getWeeks,
  countWeeks
} from "../../services/pregnancyService";
import './DisplayWeekInfo.css'

const DisplayWeekInfo = ({ user }) => {
  const [expanded, setExpanded] = useState(false);
  const [adviceExpanded, setAdviceExpanded] = useState(false);
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

  useEffect(() => {
    const fetchData = async () => {
      try {
        const [week, symptoms, advice] = await Promise.all([
          getWeeks(),
          getSymptoms(),
          getAdvice(),
        ]);

        setWeeks(week);
        setSymptoms(symptoms);
        setAdvice(advice);
      } catch (error) {
        console.error("Error fetching data:", error);
      }
    };

    fetchData();
  }, []);

  const toggleAdviceExpanded = () => {
    setAdviceExpanded(!adviceExpanded);
  };

  const toggleExpanded = () => {
    setExpanded(!expanded);
  };

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
            <p className="symptom-description">{symptom.symptom_description}</p>
          </div>
        ))}
      </div>

      <div className="advice-container">
        <h3>Consejos</h3>
        <div className={`advice-content ${adviceExpanded ? "expanded" : ""}`}>
          {advice.map((advice) => (
            <div key={advice.id}>
              <p className="advice-description">{advice.advice_description}</p>
            </div>
          ))}
        </div>
        <button onClick={toggleAdviceExpanded} className="toggle-button">
          {adviceExpanded ? "Mostrar menos" : "Leer más"}
        </button>
      </div>
    </div>
  );
};

export default DisplayWeekInfo;
