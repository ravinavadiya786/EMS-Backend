const Router = require("express").Router();

//Controles files


const Attendance = require("../controllers/Faculty/Attendance");


// -----------------------All index Of Routing -------------------

Router.use("/Attendance", Attendance);


Router.use("*", (req, res) => res.json({ Error: "Route Not Found..." }));

module.exports = Router;
