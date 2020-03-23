const Router = require("express").Router();

//Controles files

const Student = require("../controllers/Student/Student");

// -----------------------All index Of Routing -------------------

Router.use("/Student", Student);


Router.use("*", (req, res) => res.json({ Error: "Route Not Found..." }));

module.exports = Router;
