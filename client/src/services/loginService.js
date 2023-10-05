import { redirect } from "react-router-dom";

async function loginAction({ request }) { 
  let formData = await request.formData();
  let email = formData.get("email");
  let password = formData.get("password");

  fetch(`http://localhost:5000/auth`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ email, password }),
  })
    .then((response) => response.json())
    .then((authData) => {
      console.log(authData)
      localStorage.setItem('token', authData.token)
    })
    .catch((error) => {
      return {
        error: error.message,
      };
    });

    let redirectTo = formData.get("redirectTo");
    return redirect(redirectTo || `/profile`);
}
async function loginLoader() {
  return localStorage.getItem('token')
  
}

export { loginAction, loginLoader };
