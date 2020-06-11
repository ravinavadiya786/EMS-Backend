const route = require("express").Router();
const Attendance = require("../../models/Attendance");
const student = require("../../models/Student");
const facejs = require("../Face");
const multer = require("multer");
const fs = require("fs");
const role = require("../../middleware/Role");

// SET STORAGE
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "./uploads/");
  },
  filename: function (req, file, cb) {
    cb(null, file.fieldname + "-" + Date.now() + ".png");
  }
});

const upload = multer({ storage: storage });

route.get("/", role(), async (req, res) => {
  try {
    let find_Query = {}

    if (req.user.role === "Faculty") {
      find_Query['Faculty_Id'] = req.user._id

    } else if (req.user.role === "Student") {
      find_Query['Student_Id'] = req.user._id
    }
    const savedpost = await Attendance.find({ ...find_Query })
      .populate([
        { path: 'Faculty_Id', select: 'Name' },
        {
          path: 'Student_Id', select: 'Name Course_id Standard_id',
          populate: [
            { path: 'Course_id', select: 'Course_Name' },
            { path: 'Standard_id', select: 'Course_Name Name' }
          ]
        }
      ])
    res.json(savedpost);
  } catch (err) {
    res.json(err);
  }
});


route.post("/", [role(), upload.single("picture")], async (req, res) => {
  try {
    console.log('in Attecnaced')
    //Face Recognitions Proccess Start
    let facedata = [];

    const savedpost = await student.find({}).select("Face_Data Name");

    for (let i = 0; i < savedpost.length; i++) {
      const tmddata = { ...savedpost[i].Face_Data };
      const obj = {
        _label: tmddata[0]._label,
        _descriptors: tmddata[0]._descriptors
      };
      facedata.push(obj);
    }

    const Results = await facejs.facerec(facedata, "uploads/" + req.file.filename);

    //Finding STuents By Name By Results
    console.log("Result", Results);
    let countstud = 0;
    Results.filter(result => {
      savedpost.filter(student => {
        if (result === student.Name) {    // if Student Was Found success
          countstud++;
          new Attendance({ Student_Id: student._id, Faculty_Id: req.user._id, Present: "Yes" })
            .save()
            .catch(error => {
              console.log(error)
              res.json({ Error: error.message })
            });

        }
      });
    });
    res.json({ Success: Results, Found: countstud });
    try {
      fs.unlinkSync("uploads/" + req.file.filename);
    } catch (err) {
      console.error(err);
    }
  } catch (err) {
    console.log(err);
    res.json(err);
  }
});

route.put("/", role(), async (req, res) => {
  try {
    const savedpost = await Attendance.findOneAndUpdate(
      { _id: req.body._id },
      { $set: { ...req.body } }
    );

    if (savedpost)
      return res
        .status(200)
        .json({ Success: `${req.baseUrl.split("/")[2]} Are Updated` });

    return res
      .status(400)
      .json({ Error: `${req.baseUrl.split("/")[2]} Are Not Updated` });
  } catch (error) {
    res.json({ Error: error.message });
  }
});

route.delete("/", role(), async (req, res) => {
  const { _id } = req.query;

  if (!_id) return res.json({ Error: "_id is Required to Delete" });
  try {
    const savedpost = await Attendance.deleteOne({ _id });

    if (savedpost.n)
      return res
        .status(200)
        .json({ Success: `${req.baseUrl.split("/")[2]} Are Deleted` });

    res
      .status(400)
      .json({ Error: `${req.baseUrl.split("/")[2]} Are Not Deleted` });
  } catch (error) {
    res.json({ Error: error.message });
  }
});

module.exports = route;
