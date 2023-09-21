var express = require('express');
var router = express.Router();
const db = require("../model/helper");

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render( { title: 'Express' });
});

/*GET WEEKS */
router.get('/weeks/:week_number', async function (req, res){
  try{
    const result = await db(`SELECT * FROM weeks WHERE id = ${req.params.week_number};`)
    res.send(result.data)
  }catch(err){
    res.status(500).send({ error: err.message })
  }
})
/*GET SYMPTOMS */
router.get('/:week_id/symptoms', async function (req, res){
  try{
    const result = await db(`SELECT * FROM weeks_symptoms LEFT JOIN symptoms ON weeks_symptoms.symptom_id = symptoms.id WHERE week_id = ${req.params.week_id};`)
    res.send(result.data)
  }catch(err){
    res.status(500).send({ error: err.message })
  }
})
/*GET ADVICE */
router.get('/:week_id/advice', async function (req, res){
  try{
    const result = await db(`SELECT * FROM advice WHERE week_id = ${req.params.week_id};`)
    res.send(result.data)
  }catch(err){
    res.status(500).send({ error: err.message })
  }
})
/* POST USER */
router.post("/user", async function(req, res){
  const sql = `INSERT INTO users(user_name, mail, user_password, baby_name, creation_date, weeks_pregnant, photo_url) VALUES('${req.body.user_name}', '${req.body.mail}', '${req.body.user_password}', '${req.body.baby_name}', '${req.body.creation_date}', ${req.body.weeks_pregnant},'${req.body.user_name}')`

  try{
    await db(sql);
    const result = await db("SELECT * FROM users")
    res.send(result.data)
  }catch(err){
    res.status(500).send({ error: err.message });
  }
})

/*GET USER*/
router.get("/user/:id", async function(req, res){
  try{
    const result = await db(`SELECT * FROM users WHERE id = ${req.params.id};`)
    res.send(result.data)
  }catch(err){
    res.status(500).send({ error: err.message })
  }
})

/*PUT USER*/
router.put("/user/:id", async (req, res) => {
  try {
    const result = await db(
      `SELECT * FROM users WHERE id = ${req.params.id};`
    );

    if (!result) {
      res.status(404).send();
      return;
    }

    await db(
      `UPDATE users SET user_name = '${req.body.user_name}', mail = '${req.body.mail}', user_password = '${req.body.user_password}', baby_name = '${req.body.baby_name}', weeks_pregnant = ${req.body.weeks_pregnant}, photo_url = '${req.body.photo_url}' WHERE id = ${req.params.id};`
    );

    const updatedUser = await db(`SELECT * FROM users WHERE id = ${req.params.id};`);

    res.send(updatedUser.data);
  } catch (err) {
    res.status(500).send({ error: err.message });
  }
});
module.exports = router;
