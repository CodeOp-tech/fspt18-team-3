import React from "react";
import * as ReactDOM from "react-dom/client";
import App from "./App.jsx";
import "./index.css";
import { createBrowserRouter, RouterProvider, redirect } from "react-router-dom";
import ErrorPage from "./Error-page.jsx";
import Login from "./routes/Login.jsx";
import Register from "./routes/Register.jsx";
import ViewProfilePage from "./components/ViewProfilePage/ViewProfilePage";
import WeekView from "./components/WeekView/WeekView";
import { registerAction } from "./services/registerService.js";
import { loginAction, loginLoader } from "./services/loginService.js";
import {tokenDecode} from "./helpers/tokenDecode.js"

const router = createBrowserRouter([
  {
    id: "root",
    path: "/",
    loader() {
      // root route provides the user, if logged in
      // here we would return the user object
      const token = localStorage.getItem('token')
      if (!token) return redirect("/login");
      //return redirect("/profile")
      //return token
      return token
    },
    Component: App,
    errorElement: <ErrorPage />,
    children: [
      {
        Component: ViewProfilePage,
        path: "profile",
      },
      {
        Component: WeekView,
        path: "week-view",
      }
    ]
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
    Component: Register,
  },
  {
    path: "/logout",
    async action() {
      // We signout in a "resource route" that we can hit from a fetcher.Form
      //await signout();
      //return redirect("/");
      return null
    },
  },
]);

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <React.StrictMode>
    <RouterProvider router={router} fallbackElement={<p>Loading...</p>} />
  </React.StrictMode>
);
