const route = require("express").Router();
const Faculty = require("../../models/Faculty");
const role = require("../../middleware/Role");


route.get("/", role(), async (req, res) => {
  try {
    const savedpost = await Faculty.findById(req.user._id)
      .select("-Face_Data")
      .populate("Course_id");
    res.json(savedpost);
  } catch (err) {
    res.json(err);
  }
});


module.exports = route;
