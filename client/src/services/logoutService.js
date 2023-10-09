import { redirect } from "react-router-dom";

function logoutAction() {
   localStorage.removeItem("token")
   return redirect("/login");
}

export { logoutAction };
