const jwt = require("jsonwebtoken");
require("dotenv").config();
const { SECRET_KEY } = process.env;

function userShouldBeLoggedIn(req, res, next) {
  const token = req.headers["authorization"].replace(/^Bearer\s/, "");

  if (!token) {
    res.status(401).send({ message: "Please, provide a token." });
  } else {
    jwt.verify(token, SECRET_KEY, function (err, decoded) {
      if (err) res.status(401).send({ error: err.message });
      else {
        req.user_id = decoded.user_id;
        next();
      }
    });
  }
}

module.exports = userShouldBeLoggedIn;
