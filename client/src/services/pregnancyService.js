const callOptions = (method) => {
  const token = localStorage.getItem("token");

  if (!token) return;

  return {
    method,
    headers: {
      Authorization: `Bearer ${token}`,
    },
  };
};

const getUser = async () => {
  try {
    const response = await fetch(
      `http://localhost:5000/users/user`,
      callOptions("GET")
    );

    if (!response.ok) {
      throw new Error("Error retrieving the user");
    }

    const [user] = await response.json();
    return user;
  } catch (error) {
    console.error("Error fetching user:", error);
    throw error;
  }
};

const getWeeks = async () => {
  try {
    const weeks = await fetchUserAndMakeCalculation(countWeeks);
    const response = await fetch(
      `http://localhost:5000/weeks/${weeks}`,
      callOptions("GET")
    );

    if (!response.ok) {
      throw new Error("Error fetching weeks");
    }

    const weeksInfo = await response.json();
    return weeksInfo[0];
  } catch (error) {
    console.error("Error fetching weeks:", error);
    throw error;
  }
};

const getSymptoms = async () => {
  try {
    const weekId = await fetchUserAndMakeCalculation(getWeekId);
    const response = await fetch(
      `http://localhost:5000/weeks/${weekId}/symptoms`,
      callOptions("GET")
    );

    if (!response.ok) {
      throw new Error("Error fetching symptoms");
    }

    const symptom = await response.json();
    return symptom;
  } catch (error) {
    console.error("Error fetching symptoms:", error);
    throw error;
  }
};

const getAdvice = async () => {
  try {
    const weekId = await fetchUserAndMakeCalculation(getWeekId);
    const response = await fetch(
      `http://localhost:5000/weeks/${weekId}/advice`,
      callOptions("GET")
    );

    if (!response.ok) {
      throw new Error("Error fetching advice");
    }

    const advice = await response.json();
    return advice;
  } catch (error) {
    console.error("Error fetching advice:", error);
    throw error;
  }
};

const countWeeks = (user) => {
  const dateToday = new Date().toISOString().slice(0, 10);
  const simpleDate = new Date(dateToday);
  const creationDate = new Date(user?.creation_date);
  const weeksAdded = (simpleDate - creationDate) / (1000 * 60 * 60 * 24 * 7);
  return Math.round(weeksAdded + user?.weeks_pregnant);
};

const getWeekId = (user) => countWeeks(user) - 2;

const countWeeksLeft = (user) => 40 - countWeeks(user);

const fetchUserAndMakeCalculation = async (callback) => {
  try {
    const user = await getUser();
    return callback(user);
  } catch (error) {
    console.error("Error fetching user:", error);
  }
};

export {
  getAdvice,
  getSymptoms,
  getUser,
  getWeeks,
  countWeeks,
  countWeeksLeft,
  getWeekId,
};
