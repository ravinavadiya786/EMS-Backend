const route = require("express").Router();
const Course = require("../../models/Course");
const role = require("../../middleware/Role");


//   role("Faculty")  role("Student")

route.get("/", role(), async (req, res) => {
  try {
    const savedpost = await Course.find({});
    res.json(savedpost);
  } catch (err) {
    res.json(err);
  }
});

route.post("/", role(), async (req, res) => {
  try {
    await new Course({
      ...req.body
    }).save();

    res
      .status(200)
      .json({
        Success: `${req.baseUrl.split("/")[2]} Are Suucessfully Created`
      });
  } catch (error) {
    res.json({ Error: error.message });
  }
});

route.put("/", role(), async (req, res) => {
  try {
    const savedpost = await Course.findOneAndUpdate(
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
    const savedpost = await Course.deleteOne({ _id });

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
