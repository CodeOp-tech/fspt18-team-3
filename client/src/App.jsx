import Login from "./routes/Login.jsx";
import Register from "./routes/Register.jsx";
import User from "./routes/User.jsx";
import ErrorPage from "./Error-page.jsx";
import Home from "./components/Home/Home.jsx";
import { Routes, Route, Link, useNavigate } from "react-router-dom";

function App() {

  const authHandler = () => {

  }

  const signUpHandler = () => {
    
  }


  return (
    <Routes>
      <Route index path="/home/*" element={<Home />} />
      <Route path="/login" element={<Login onLogin={authHandler}/>} />
      <Route path="/register" element={<Register onRegister={signUpHandler}/>} />
      <Route path="/user" element={<User />} />
      <Route path="*" element={<ErrorPage />} />
    </Routes>
  );
}

export default App;
