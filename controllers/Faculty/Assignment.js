const route = require("express").Router();
const multer = require("multer");
const role = require("../../middleware/Role");
const Assignment_Faculty = require("../../models/Assignment_Faculty");


// SET STORAGE

const upload = multer({ dest: './uploads/Assignment/Faculty/' });

route.get("/", role(), async (req, res) => {
    try {
        // { path: 'Student_Id', populate: { path: 'Course_id' }}populate('Faculty_Id','Name Course_id');.populate({ path: 'Student_Id', populate: { path: 'Course_id' }}, "Name Course_id Standard_id")
        const savedpost = await Assignment_Faculty.find({})
        res.json(savedpost);
    } catch (err) {
        res.json({ Error: err });
    }
});


route.post("/", [role(), upload.single("Asmt_file")], async (req, res) => {
    try {
        console.log('in Assignment')
        console.log('files',req.file.filename)
        console.log('Body',req.body)

        // await new Assignment_Faculty({
        //     ...req.body
        // }).save();

        res.json({ Success: `${req.baseUrl.split("/")[2]} Are Submited` });
    } catch (err) {
        res.json({ Error: err });
    }
});


route.put("/", role(), async (req, res) => {
    try {
        const savedpost = await Assignment_Faculty.findOneAndUpdate(
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
        const savedpost = await Assignment_Faculty.deleteOne({ _id });

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
