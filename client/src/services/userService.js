import { redirect } from "react-router-dom";

async function updateUserAction({ request }) {
  let formData = await request.formData();

  let email = formData.get("email");
  let username = formData.get("username");
  let password = formData.get("password");
  let babyName = formData.get("babyName");
  let weeksPregnant = formData.get("weeksPregnant");

  const userUpdateData = {
    mail: email,
    user_name: username,
    user_password: password,
    baby_name: babyName,
    weeks_pregnant: weeksPregnant,
  };

  try {
    const token = localStorage.getItem("token");
    if (!token) return;

    const response = await fetch(`http://localhost:5000/users/user`, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${token}`,
      },
      body: JSON.stringify(userUpdateData),
    });

    if (!response.ok) {
      throw new Error("Error retrieving the updated user");
    }

    const [updatedUser] = await response.json();
    console.log('updatedUser', updatedUser)
    return redirect("/profile");
  } catch (error) {
    console.error("Error fetching user:", error);
    throw error;
  }
}

export { updateUserAction };
