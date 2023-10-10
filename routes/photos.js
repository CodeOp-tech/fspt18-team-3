var express = require('express');
const router = express.Router();
const db = require("../model/helper");
const fs = require("fs/promises");
const path = require("path");
const multer = require('multer');
const upload = multer({dest: '/public/photos'});
const { v4: uuidv4 } = require('uuid');
const mime = require('mime-types');


/*GET PHOTOS*/


const getPhotos = async (req, res) => {
  try{
    const result = await db(`SELECT * FROM posts WHERE user_id = ${req.params.user_id};`);
    res.send(result.data);
  }catch(err){
    res.status(500).send({ error: err.message });
  }
}

router.get("/:user_id", getPhotos);

/* POST PHOTO */
router.post("/:user_id/:week_id", upload.single("photofile"), async function(req, res){
  const photofile = req.file;

  const extension = mime.extension(photofile.mimetype);

  const photoname = uuidv4() + "." + extension;

  const tmp_path = photofile.path;

  const target_path = path.join(__dirname, "../public/photos/") + photoname;

    try{
      await fs.rename(tmp_path, target_path);
      await db(`INSERT INTO posts (user_id, week_id, path) VALUES (${req.params.user_id}, ${req.params.week_id}, '${photoname}') ;`)
      getPhotos(req,res)
    }catch(err){
      res.status(500).send({ error: err.message });
    }
  })



module.exports = router;