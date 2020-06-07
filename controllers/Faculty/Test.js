const route = require("express").Router();
const Test_Master = require("../../models/Test_Master");
const Test_Questions = require("../../models/Test_Questions");
const role = require("../../middleware/Role");

route.get("/", role(), async (req, res) => {
    try {
        let savedpost = await Test_Master.find({ Faculty_ID: req.user._id })
            .populate(['Course_ID', 'Subject_ID']);

        if (savedpost.length) {
            savedpost = savedpost.map(item => {
                return {
                    "Is_Active": item.Is_Active,
                    "_id": item._id,
                    "Test_Name": item.Test_Name,
                    "Course_Name": item.Course_ID.Course_Name,
                    "Sub_Name": item.Subject_ID.Sub_Name,
                    "Created_On": item.Created_On,
                }
            })
        }
        res.json(savedpost);
    } catch (err) {
        res.json(err);
    }
});

route.post("/", role(), async (req, res) => {
    try {
        const { Test_Name, Course_ID, Subject_ID, ArrQuestions } = req.body
        function hasDuplicates(array) {
            return (new Set(array)).size !== array.length;
        }
        if (hasDuplicates(ArrQuestions.map(item => item.Question))) return res.json({ Error: 'QUESTIONS  Is Dublicate!' })

        const Test_MasterData = await new Test_Master({
            Test_Name, Course_ID, Subject_ID, Faculty_ID: req.user._id
        }).save()


        if (Test_MasterData) {
            const final_Aryy = ArrQuestions.map(item => {
                return {
                    Question_Name: item.Question,
                    Answer: [item.AnsA, item.AnsB, item.AnsC, item.AnsD],
                    Correct_Ans: item.Correct_Ans,
                    Test_Master_ID: Test_MasterData._id
                }
            })
            await Test_Questions.insertMany(final_Aryy)
            res.json({
                Success: `${req.baseUrl.split("/")[2]} Are Sucessfully Created`
            });
        }

    } catch (error) {
        res.json({ Error: error.message });
    }
});

route.put("/", role(), async (req, res) => {
    try {
        const savedpost = await Test_Master.findOneAndUpdate(
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
        const savedpost = await Test_Master.deleteOne({ _id });


        if (savedpost.n) {
            const savedpost = await Test_Questions.deleteOne({ Test_Master_ID: _id });
            return res
                .status(200)
                .json({ Success: `${req.baseUrl.split("/")[2]} Are Deleted` });
        }

        res
            .status(400)
            .json({ Error: `${req.baseUrl.split("/")[2]} Are Not Deleted` });
    } catch (error) {
        res.json({ Error: error.message });
    }
});

module.exports = route;
