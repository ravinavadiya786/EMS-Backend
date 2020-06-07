const mongoose = require("mongoose");
const uniqueValidator = require("mongoose-unique-validator");

const AssignmentStudent = new mongoose.Schema({
  Student_ID: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    ref: "Student"
  },
  AssignmentFaculty_ID: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    ref: "AssignmentFaculty"
  },
  Stud_Asmt_file: {
    type: String,
    required: true
  },
  Submit_Date: {
    type: Date,
    default: new Date(),
    required: true
  }
});

AssignmentStudent.plugin(uniqueValidator, {
  message: "Must be Unique."
});

module.exports = mongoose.model("AssignmentStudent", AssignmentStudent);
