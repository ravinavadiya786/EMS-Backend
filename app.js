const express = require("express");
const bodyParsher = require("body-parser");
const mongoose = require("mongoose");
const cors = require("cors");
const dotenv = require("dotenv");
const path = require('path');

//  ------------controlllers----------
const Auth = require("./controllers/Auth");
const Admin_index = require("./routes/Admin_index");
const Faculty_index = require("./routes/Faculty_index");
const Student_index = require("./routes/Student_index");

//setup express js port
const app = express();

app.use(cors());

dotenv.config();



// contecing database
mongoose
  .connect(process.env.DB_URL, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useCreateIndex: true,
    useFindAndModify: false
  })
  .then(() => {
    console.log(`database connection Is Successfully to ${process.env.DB_URL}`);
  })
  .catch(e => {
    console.log(e);
  });



app.use(bodyParsher.json());
app.use(bodyParsher.urlencoded({ extended: true }));

app.use('/Assignment/Faculty', express.static(path.join(__dirname, './uploads/Assignment/Faculty')))
app.use('/Assignment/Students', express.static(path.join(__dirname, './uploads/Assignment/Students')))
app.use('/Event_Gellary', express.static(path.join(__dirname, './uploads/Event_Gellary')))


// -----------------------All index Of Routing -------------------

app.use("/Auth", Auth);
app.use("/Admin", Admin_index);
app.use("/Faculty", Faculty_index);
app.use("/Student", Student_index);

const port = process.env.PORT || 8050;
app.listen(port, () => {
  console.log(`server Started On ${port}...`);
});
