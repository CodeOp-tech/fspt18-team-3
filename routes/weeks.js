var express = require("express");
var router = express.Router();
const db = require("../model/helper");
const jwt = require("jsonwebtoken");
const userShouldBeLoggedIn = require("../middlewares/userShouldBeLoggedIn");

require("dotenv").config();

const { SECRET_KEY } = process.env;

/*GET WEEKS */
router.get("/:weeks_number", userShouldBeLoggedIn, async (req, res) => {
  const weeksNumber = Number(req.params.weeks_number);
  try {
    const query = `SELECT * FROM weeks WHERE week_number = ${weeksNumber};`;
    const week = await db(query);
    if (!week) {
      return res.status(404).send({ error: "Week not found" });
    }
    res.status(201).send(week.data);
  } catch (error) {
    res.status(500).send({ error: error.message });
  }
});

/*GET SYMPTOMS */
router.get(
  "/:week_id/symptoms", userShouldBeLoggedIn, async function (req, res) {
    try {
      const symptoms = await db(
        `SELECT * FROM weeks_symptoms LEFT JOIN symptoms ON weeks_symptoms.symptom_id = symptoms.id WHERE week_id = ${Number(req.params.week_id)};`
      );
      res.send(symptoms.data);
    } catch (err) {
      res.status(500).send({ error: err.message });
    }
  }
);

/*GET ADVICE */
router.get("/:week_id/advice", userShouldBeLoggedIn, async function (req, res) {
  try {
    const advice = await db(
      `SELECT * FROM advice WHERE week_id = ${Number(req.params.week_id)};`
    );
    res.send(advice.data);
  } catch (err) {
    res.status(500).send({ error: err.message });
  }
});

/*********************************** HELPERS ***************************************/

async function getUserDataFromToken(token) {
  const payload = jwt.verify(token, SECRET_KEY);
  const query = `SELECT * FROM users WHERE id = ${payload.userId};`;
  const [user] = await db(query);
  if (!user) {
    throw new Error("User not found");
  }
  return user;
}

module.exports = router;
