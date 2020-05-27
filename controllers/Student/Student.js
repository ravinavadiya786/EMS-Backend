const route = require("express").Router();
const student = require("../../models/Student");
const role = require("../../middleware/Role");


route.get("/", role(), async (req, res) => {
  try {
    const students = await student
      .findById(req.user._id)
      .select("-Face_Data")
      .populate(["Standard_id", "Course_id"]);
    res.json(students);
  } catch (err) {
    res.json(err);
  }
});


module.exports = route;
