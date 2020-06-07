const mongoose = require("mongoose");
const uniqueValidator = require("mongoose-unique-validator");

const AssignmentFaculty = new mongoose.Schema({
  Faculty_ID: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    ref: "Faculty"
  },
  Sub_ID: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    ref: "Subject"
  },
  Course_id: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    ref: "Course"
  },
  Asmt_file: {
    type: String,
    required: true
  },
  Title: {
    type: String,
    required: true
  },
  Submision_Date: {
    type: Date,
    required: true
  },
  Date: {
    type: Date,
    default: new Date(),
    required: true
  },
  Is_Active: {
    type: Boolean,
    default: true,
    required: true
  },
  Is_Submitted: {
    type: Boolean,
    default: false,
    required: true
  }
});

AssignmentFaculty.plugin(uniqueValidator, {
  message: "Must be Unique."
});

module.exports = mongoose.model("AssignmentFaculty", AssignmentFaculty);
