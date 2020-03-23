const mongoose = require("mongoose");
const uniqueValidator = require("mongoose-unique-validator");

const TimeTable = new mongoose.Schema({
  Course_ID: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    ref:"Course"
  },
  Std_ID : {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    ref:"Standard"
  },
  Subject_ID : {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    ref:"Subject"
  },
  Division_ID : {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    ref:"Division"
  },
  Day: {
    type: String,
    required: true
  },
  From_Time: {
    type: String,
    required: true
  },
  To_Time: {
    type: String,
    required: true
  },
   Is_Active: {
    type: Boolean,
    default: true,
    required: true
  },
});

TimeTable.plugin(uniqueValidator, {
  message: "Must be Unique."
});

module.exports = mongoose.model("TimeTable", TimeTable);
