const mongoose = require("mongoose");
const uniqueValidator = require("mongoose-unique-validator");

const Attendance = new mongoose.Schema({
  Student_Id: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    ref:"Student"
  },
  Faculty_Id: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    ref:"Faculty"
  },
  Present: {
    type: String,
    required: true
  },
  Date: {
    type: Date,
    default: Date.now,
    required: true
  }
});

Attendance.plugin(uniqueValidator, {
  message: "Must be Unique."
});

module.exports = mongoose.model("Attendance", Attendance);
