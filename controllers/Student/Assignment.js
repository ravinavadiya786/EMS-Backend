const route = require("express").Router();
const multer = require("multer");
const role = require("../../middleware/Role");
const Assignment_Student = require("../../models/Assignment_Student");
const Assignment_Faculty = require("../../models/Assignment_Faculty");
const Student = require("../../models/Student");


const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, "./uploads/Assignment/Students/");
    },
    filename: function (req, file, cb) {
        cb(null, `${Date.now()}_${file.originalname}`)
    }
});

const upload = multer({ storage: storage });

route.get("/Availble_Assignment", role(), async (req, res) => {
    try {
        const studentData = await Student.findOne({ _id: req.user._id }, 'Course_id');

        const savedpost = await Assignment_Faculty
            .find({ Course_id: studentData.Course_id, Is_Active: true, Is_Submitted: false })
            .populate(["Sub_ID", {
                path: 'Faculty_ID',
                select: 'Name'
            }]);
        res.json(savedpost);
    } catch (err) {
        console.log(err)
        res.json({ Error: err });
    }
});

route.get("/Submited_Assignment", role(), async (req, res) => {
    try {
        const savedpost = await Assignment_Student
            .find({ Student_ID: req.user._id })
            .populate({
                path: "AssignmentFaculty_ID",
                populate: [{
                    path: 'Sub_ID',
                    select: 'Sub_Name'
                },
                {
                    path: 'Faculty_ID',
                    select: 'Name'
                }]
            });
        res.json(savedpost);
    } catch (err) {
        res.json({ Error: err });
    }
});

route.post("/", [role(), upload.single("Asmt_file")], async (req, res) => {
    try {
        req.body.Student_ID = req.user._id
        req.body.Stud_Asmt_file = `http://localhost:8050/Assignment/Students/${req.file.filename}`
        await new Assignment_Student({
            ...req.body
        }).save();

        await Assignment_Faculty.findOneAndUpdate(
            { _id: req.body.AssignmentFaculty_ID },
            { $set: { Is_Submitted: true } }
        );
        res.json({ Success: `${req.baseUrl.split("/")[2]} Are Submited` });
    } catch (err) {
        console.log(err)
        res.json({ Error: err });
    }
});

route.put("/", role(), async (req, res) => {
    try {
        const savedpost = await Assignment_Student.findOneAndUpdate(
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
        const savedpost = await Assignment_Student.deleteOne({ _id });

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
