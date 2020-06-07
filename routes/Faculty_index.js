const Router = require("express").Router();

//Controles files


const Attendance = require("../controllers/Faculty/Attendance");
const Faculty = require("../controllers/Faculty/Faculty");
const Test = require("../controllers/Faculty/Test");
const Assignment = require("../controllers/Faculty/Assignment");




// -----------------------All index Of Routing -------------------

Router.use("/Attendance", Attendance);
Router.use("/Faculty", Faculty);
Router.use("/Test", Test);
Router.use("/Assignment", Assignment);




Router.use("*", (req, res) => res.json({ Error: "Route Not Found..." }));

module.exports = Router;
