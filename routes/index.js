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

router.get('/:week_id/symptoms', async function (req, res){
  try{
    const result = await db(`SELECT * FROM weeks_symptoms LEFT JOIN symptoms ON weeks_symptoms.symptom_id = symptoms.id WHERE week_id = ${req.params.week_id};`)
    res.send(result.data)
  }catch(err){
    res.status(500).send({ error: err.message })
  }
})

router.get('/:week_id/advice', async function (req, res){
  try{
    const result = await db(`SELECT * FROM advice WHERE week_id = ${req.params.week_id};`)
    res.send(result.data)
  }catch(err){
    res.status(500).send({ error: err.message })
  }
})
module.exports = router;
