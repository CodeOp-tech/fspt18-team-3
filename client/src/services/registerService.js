import { redirect } from "react-router-dom";

async function registerAction({ request }) {
  const formData = await request.formData();
  const email = formData.get("email");
  const password = formData.get("password");
  const rePassword = formData.get("rePassword");
  const username = formData.get("username");
  const babyName = formData.get("babyName");
  const weeksPregnant = formData.get("weeksPregnant");

  if (password !== rePassword) return;

  if (!email || !password || !username || !weeksPregnant) {
    return {
      error: "You must provide the required information",
    };
  }

  const userInfo = {
    mail: email,
    user_name: username,
    user_password: password,
    baby_name: babyName,
    weeks_pregnant: weeksPregnant,
    creation_date: new Date().toISOString().slice(0, 10),
  };

  fetch(`http://localhost:5000/users/user`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(userInfo),
  })
    .then((response) => response.json())
    .then((userId) => {
      return {message: "The user was successfully signed up", userId}
    })
    .catch((error) => {
      console.error(error);
      return {
        error: "Invalid registration attempt",
      };
    });

  const redirectTo = formData.get("redirectTo");
  return redirect(redirectTo || "/login");
}

export { registerAction };
