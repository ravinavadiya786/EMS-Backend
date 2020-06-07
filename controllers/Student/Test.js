const route = require("express").Router();
const Test_Master = require("../../models/Test_Master");
const Test_Questions = require("../../models/Test_Questions");
const Test_Students = require("../../models/Test_Students");

const Student = require("../../models/Student");


const role = require("../../middleware/Role");

route.get("/", role(), async (req, res) => {
    try {
        let savedpost = [];
        let Test_Results = [];
        const studentData = await Student.findOne({ _id: req.user._id }, 'Course_id');

        let Test_MasterData = await Test_Master.find({ Is_Active: true, Course_ID: studentData.Course_id }, 'Test_Name Is_Finished').populate({
            path: 'Subject_ID',
            select: 'Sub_Name'
        });

        if (Test_MasterData.length) {
            savedpost = await Test_Questions.find({ Test_Master_ID: Test_MasterData.map(item => item._id) });

            Test_MasterData = Test_MasterData.filter(item => {
                if (item.Is_Finished) {
                    Test_Results.push(item)
                    return false
                }
                return true
            })


            if (Test_Results.length) {
                Test_Results = await Test_Students.find({ Student_ID: req.user._id, Test_Master_ID: Test_Results.map(item => item._id) })
                    .populate({
                        path: 'Test_Master_ID',
                        select: 'Test_Name Subject_ID',
                        populate: [{
                            path: 'Subject_ID',
                            select: 'Sub_Name'
                        },
                        {
                            path: 'Faculty_ID',
                            select: 'Name'
                        }]
                    });

            }
        }

        res.json({ Test_Names: Test_MasterData, Test_Questions: savedpost, Test_Results: Test_Results });
    } catch (err) {
        res.json({ Error: err });
    }
});

route.post("/", role(), async (req, res) => {
    try {
        const { Score, Test_Master_ID, WrongAnsCnt } = req.body

        await new Test_Students({
            Score, WrongAnsCnt, Test_Master_ID, Student_ID: req.user._id
        }).save();

        res.json({
            Success: `Test is Sucessfully Submited`
        });

    } catch (error) {
        res.json({ Error: error.message });
    }
});


module.exports = route;
