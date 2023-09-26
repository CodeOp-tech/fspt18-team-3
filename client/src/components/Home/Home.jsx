import logo_babybump from "../../assets/logo_babybump.png";
import "./Home.css";
import PregnancyForm from "../PregnancyForm/PregnancyForm";
import WeekView from "../WeekView/WeekView";

function Home() {

  return (
    <>
      <div>
        <a>
          <img src={logo_babybump} className="logo" alt="App logo" />
        </a>
      </div>
      <h1>Baby Bump</h1>
      <PregnancyForm />
      <WeekView />
    </>
  );
}

export default Home;
