var express = require("express");
var router = express.Router();
const db = require("../model/helper");
const bcrypt = require("bcrypt");
const userShouldBeLoggedIn = require("../middlewares/userShouldBeLoggedIn");

require("dotenv").config();

/* POST USER */
router.post("/user", async (req, res) => {
  try {
    const {
      user_name,
      mail,
      user_password,
      baby_name,
      creation_date,
      weeks_pregnant,
    } = req.body;
    const hashedPassword = await hashPassword(user_password);

    const sql = `
      INSERT INTO users (user_name, mail, user_password, baby_name, creation_date, weeks_pregnant) 
      VALUES ('${user_name}', '${mail}', '${hashedPassword}', '${baby_name}', '${creation_date}', ${weeks_pregnant});`;

    await db(sql);

    const selectUserQuery = `SELECT * FROM users WHERE mail = '${mail}';`;
    const result = await db(selectUserQuery);

    res.send({ message: "The user was registered!", data: result.data[0].id });
  } catch (error) {
    res.status(500).send({ error: error.message });
  }
});

/*GET USER*/
router.get("/user", userShouldBeLoggedIn, async function (req, res) {
  try {
    const result = await db(`SELECT * FROM users WHERE id = ${req.user_id};`);
    res.send(result.data);
  } catch (err) {
    res.status(500).send({ error: err.message });
  }
});

/*PUT USER*/
router.put("/user", userShouldBeLoggedIn, async function (req, res) {

  try {
    const hashedPassword = await hashPassword(req.body.user_password);
    const result = await db(`SELECT * FROM users WHERE id = ${req.user_id};`);
    const userFound = result.data[0]

    if (!userFound) {
      res.status(404).send({ message: "User not found" });
      return;
    }

    await db(
      `UPDATE users SET user_name = '${req.body.user_name}', mail = '${req.body.mail}', user_password = '${hashedPassword}', baby_name = '${req.body.baby_name}', weeks_pregnant = ${req.body.weeks_pregnant}, photo_url = '${req.body.photo_url}' WHERE id = ${req.user_id};`
    );

    const updatedUser = await db(
      `SELECT * FROM users WHERE id = ${req.user_id};`
    );

    res.send(updatedUser.data);
  } catch (err) {
    res.status(500).send({ error: "An error occurred while updating user information" });
  }
});

/*DELETE USER*/
router.delete("/user/:id", userShouldBeLoggedIn, async (req, res) => {
  try {
    const result = await db(`SELECT * FROM users WHERE id = ${req.params.id};`);

    if (!result) {
      res.status(404).send();
      return;
    }

    await db(`DELETE FROM users WHERE id = ${req.params.id};`);

    const updatedUsers = await db("SELECT * FROM users ORDER BY id ASC;");

    res.send(updatedUsers.data);
  } catch (err) {
    res.status(500).send({ error: err.message });
  }
});

/************************* HELPERS *****************************/

async function hashPassword(password) {
  const { BCRYPT_WORK_FACTOR } = process.env;
  const hashedPassword = await bcrypt.hash(
    password,
    Number(BCRYPT_WORK_FACTOR)
  );
  return hashedPassword;
}

module.exports = router;
