var express = require('express');
var router = express.Router();
const db = require("../model/helper");


/*GET PHOTOS*/
router.get("/:id_user/photos", async function(req, res){
    try{
      const result = await db(`SELECT * FROM posts WHERE user_id = ${req.params.user_id};`)
      res.send(result.data)
    }catch(err){
      res.status(500).send({ error: err.message })
    }
  })


/* POST USER */
router.post("/:id_user/:week_id/photo", async function(req, res){
    const sql = `INSERT INTO posts(user_id, week_id, photo, photo_description, date_posted) VALUES(${req.params.user_id}, ${req.params.week_id}, '${req.body.photo}', '${req.body.photo_description}', '${req.body.date_posted}')`
  
    try{
      await db(sql);
      const result = await db(`SELECT * FROM posts WHERE user_id = ${req.params.user_id};`)
      res.send(result.data)
    }catch(err){
      res.status(500).send({ error: err.message });
    }
  })



module.exports = router;