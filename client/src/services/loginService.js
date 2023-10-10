import { redirect } from "react-router-dom";

async function loginAction({ request }) {
  let formData = await request.formData();
  let email = formData.get("email");
  let password = formData.get("password");

  return fetch(`http://localhost:5000/auth`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ email, password }),
  })
    .then((response) => response.json())
    .then((authData) => {
      if (authData.token) {
        localStorage.setItem("token", authData.token);
        return redirect("/profile");
      }
    })
    .catch((error) => {
      return {
        error: error.message,
      };
    });
}

async function loginLoader() {
  return localStorage.getItem("token");
}

export { loginAction, loginLoader };
