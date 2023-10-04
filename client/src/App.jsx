import { Outlet } from "react-router-dom"; // Nuevo "useLocation"
//import AuthStatus from "./components/AuthStatus/AuthStatus";



function App() {

  return (
    <>
      {/* <AuthStatus /> */}
      <Outlet /> 
    </>
  );
}

export default App;

