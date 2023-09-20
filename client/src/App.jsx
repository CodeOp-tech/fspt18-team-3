import logo_babybump from "./assets/logo_babybump.png";
import "./App.css";
import PregnancyForm from "./components/PregnancyForm/PregnancyForm";
import WeekView from "./components/WeekView/WeekView";

function App() {
  return (
    <>
      <div>
        <a>
          <img src={logo_babybump} className="logo" alt="App logo" />
        </a>
      </div>
      <h1>Baby Bump</h1>
      <div className="card">
        <p>
          Descubre semana a semana cómo crece tu bebé y diviértete en esta etapa
          tan bonita
        </p>
      </div>
      <PregnancyForm />
      <WeekView />
    </>
  );
}

export default App;
