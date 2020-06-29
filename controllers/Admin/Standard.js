const route = require("express").Router();
const Standard = require("../../models/Standard");
const role = require("../../middleware/Role");

route.get("/", role(), async (req, res) => {
  try {
    const savedpost = await Standard.find({}).populate("Course_ID");
    // const data = savedpost.map(element => { return { ...element._doc , Created_On: dateFormat(element.Created_On, "dd-mm-yyyy")}
    //  })
    //  .map(element => {

    //   if(element.Is_Active)
    //   {
    //      if(element.Course_ID) return element
    //      else return { ...element , Course_ID : { Course_Name : 'Deleted Recorde' }   }
    //   }
    // })         do not delete
    res.json(savedpost);
  } catch (err) {
    console.log(err);
    res.json(err);
  }
});

route.post("/", role(), async (req, res) => {
  try {
    await new Standard({
      ...req.body
    }).save();

    res.json({
      Success: `${req.baseUrl.split("/")[2]} Are Suucessfully Created`
    });
  } catch (error) {
    res.json({ Error: error.message });
  }
});

route.put("/", role(), async (req, res) => {
  try {
    const savedpost = await Standard.findOneAndUpdate(
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
    const savedpost = await Standard.deleteOne({ _id });

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
