import React from "react";
import * as ReactDOM from "react-dom/client";
import App from "./App.jsx";
import "./index.css";
import {
  createBrowserRouter,
  RouterProvider,
  redirect,
} from "react-router-dom";
import ErrorPage from "./Error-page.jsx";
import Login from "./routes/Login.jsx";
import Register from "./routes/Register.jsx";
import ViewProfilePage from "./components/ViewProfilePage/ViewProfilePage";
import WeekView from "./components/WeekView/WeekView";
import { registerAction, registerLoader } from "./services/registerService.js";
import { loginAction, loginLoader } from "./services/loginService.js";
import { logoutAction } from "./services/logoutService.js";
import EditUser from "./components/EditUser/EditUser.jsx";
import { getUser } from "./services/pregnancyService.js";
import { updateUserAction } from "./services/userService.js";

const router = createBrowserRouter([
  {
    id: "root",
    path: "/",
    loader() {
      const token = localStorage.getItem("token");
      if (!token) return redirect("/login");
      return token;
    },
    Component: App,
    errorElement: <ErrorPage />,
    children: [
      {
        path: "logout",
        action: logoutAction,
      },
      {
        Component: ViewProfilePage,
        path: "profile",
      },
      {
        Component: WeekView,
        path: "week-view",
      },
      {
        path: "edit",
        loader: async () => await getUser(),
        action: updateUserAction,
        Component: EditUser
      },
    ],
  },
  {
    path: "/login",
    action: loginAction,
    loader: loginLoader,
    Component: Login,
  },
  {
    path: "/register",
    action: registerAction,
    loader: registerLoader,
    Component: Register,
  },
]);

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <React.StrictMode>
    <RouterProvider router={router} fallbackElement={<p>Loading...</p>} />
  </React.StrictMode>
);
