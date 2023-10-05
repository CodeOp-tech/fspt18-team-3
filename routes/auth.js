var express = require("express");
var router = express.Router();
const db = require("../model/helper");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");

require("dotenv").config();

/* AUTH USER */
router.post("/", async function (req, res) {
  const { SECRET_KEY } = process.env;
  const { email, password } = req.body;

  const sql = `SELECT * FROM users WHERE mail = '${email}';`;

  try {
    const result = await db(sql);

    const user = result.data[0];

    if (user) {
      let passwordMatches = await bcrypt.compare(
        password,
        result.data[0].user_password
      );

      if (passwordMatches) {
        const payload = { user_id: result.data[0].id };
        const token = jwt.sign(payload, SECRET_KEY);
        res.status(200).send({ message: "Successful authentication", token, userId: result.data[0].id });
      } else {
        res.status(400).send({ error: "Incorrect username or password" });
      }
    } else {
      res.status(400).send({ error: "Incorrect username or password" });
    }
  } catch (err) {
    res.status(500).send({ error: err.message });
  }
});

module.exports = router;
