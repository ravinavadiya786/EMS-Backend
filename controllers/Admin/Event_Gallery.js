const route = require("express").Router();
const fs = require('fs');
const multer = require("multer");

const role = require("../../middleware/Role");

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, "./uploads/Event_Gellary");
    },
    filename: function (req, file, cb) {
        console.log(`${Date.now()}_${file.originalname}`)
        cb(null, `${Date.now()}_${file.originalname}`)
    }
});

const upload = multer({ storage: storage });

route.get("/", role(), async (req, res) => {
    const urls = []
    const Event_Gellary_Folder = './uploads/Event_Gellary/';
    fs.readdirSync(Event_Gellary_Folder).forEach(file => {
        urls.push(`http://localhost:8050/Event_Gellary/${file}`);
    });
    res.send(urls)
});

route.post("/", [role(), upload.single("uploadedImage")], async (req, res) => {
    res.send('success')
});
route.delete("/", role(), async (req, res) => {

});

module.exports = route;
