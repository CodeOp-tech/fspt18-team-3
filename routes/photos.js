var express = require('express');
var router = express.Router();
const db = require("../model/helper");
const multer = require('multer');
const upload = multer({dest: '../public/photos'});
const { v4: uuidv4 } = require('uuid');
const mime = require('mime-types');


/*GET PHOTOS*/
router.get("/:user_id", async function (req, res) {
  try{
    const result = await db(`SELECT * FROM posts WHERE user_id = ${req.params.user_id};`);
    res.send(result.data);
  }catch(err){
    res.status(500).send({ error: err.message });
  }
});





/* POST USER */
router.post("/:user_id/:week_id", upload.single("photofile"), async function(req, res){
  const photofile = req.file;

  const extension = mime.extension(photofile.mimetype);

  const photoname = uuidv4() + "." + extension;

  const tmp_path = photofile.path;

  const target_path = path.join(__dirname, "../public/photos/") + photoname;

    try{
      await fs.rename(tmp_path, target_path);
      await db(`INSERT INTO posts (user_id, week_id, path, photo_description, date_posted) VALUES (${req.params.user_id}, ${req.params.week_id}, '${photoname}', '${req.body.description}', '${req.body.date_posted}') ;`)
      getPhotos(req,res);
    }catch(err){
      res.status(500).send({ error: err.message });
    }
  })



module.exports = router;