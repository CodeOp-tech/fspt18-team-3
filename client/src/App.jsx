import { Outlet } from "react-router-dom";
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
