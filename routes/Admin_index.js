const Router = require("express").Router();

//Controles files

const Course = require("../controllers/Admin/Course");
const Standard = require("../controllers/Admin/Standard");
const Division = require("../controllers/Admin/Division");
const Subject = require("../controllers/Admin/Subject");
const Notice_Borad = require("../controllers/Admin/Notice_Borad");
const TimeTable = require("../controllers/Admin/TimeTable");
const Student = require("../controllers/Admin/Student");
const Faculty = require("../controllers/Admin/Faculty");
const Event = require("../controllers/Admin/Event");
const Event_Gallery = require("../controllers/Admin/Event_Gallery");




// -----------------------All index Of Routing -------------------


Router.use("/Student", Student);
Router.use("/Faculty", Faculty);
Router.use("/Course", Course);
Router.use("/Standard", Standard);
Router.use("/Division", Division);
Router.use("/Subject", Subject);
Router.use("/TimeTable", TimeTable);
Router.use("/Notice_Borad", Notice_Borad);
Router.use("/Event", Event);
Router.use("/Event_Gallery", Event_Gallery);




Router.use("*", (req, res) => res.json({ Error: "Route Not Found..." }));

module.exports = Router;
