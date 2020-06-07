const Router = require("express").Router();

//Controles files

const Student = require("../controllers/Student/Student");
const Test = require("../controllers/Student/Test");
const Assignment = require("../controllers/Student/Assignment");



// -----------------------All index Of Routing -------------------

Router.use("/Student", Student);
Router.use("/Test", Test);
Router.use("/Assignment", Assignment);




Router.use("*", (req, res) => res.json({ Error: "Route Not Found..." }));

module.exports = Router;
