const express = require("express");
const bodyParsher = require("body-parser");
const mongoose = require("mongoose");
const cors = require("cors");
const dotenv = require("dotenv");
dotenv.config();

//  ------------controlllers----------
const Auth = require("./controllers/Auth");
const Admin_index = require("./routes/Admin_index");
const Faculty_index = require("./routes/Faculty_index");
const Student_index = require("./routes/Student_index");

// contecing database
mongoose
  .connect(process.env.DB_URL, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useCreateIndex: true,
    useFindAndModify: false
  })
  .then(() => {
    console.log("database connection Is Successfully");
  })
  .catch(e => {
    console.log(e);
  });

//setup express js port
const app = express();

app.use(bodyParsher.json());
app.use(bodyParsher.urlencoded({ extended: true }));
app.use(cors());

// -----------------------All index Of Routing -------------------

app.use("/Auth", Auth);
app.use("/Admin", Admin_index);
app.use("/Faculty", Faculty_index);
app.use("/Student", Student_index);

const port = process.env.PORT || 8050;
app.listen(port, () => {
  console.log(`server Started On ${port}...`);
});
