import logo_babybump from "../../assets/logo_babybump.png";
import "./HeaderUser.css";

function HeaderUser() {

  return (
    <>
      <div>
        <a>
          <img src={logo_babybump} className="logo" alt="App logo" />
        </a>
      </div>
      <h1>Baby Bump</h1>
    </>
  );
}

export default HeaderUser;
