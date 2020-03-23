const mongoose = require("mongoose");
const uniqueValidator = require("mongoose-unique-validator");

const AssignmentFaculty = new mongoose.Schema({
    Asmt_ID: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    unique: true
  },
    Faculty_ID: {
    type: mongoose.Schema.Types.ObjectId,
    required: true
  },
  Sub_ID: {
    type: mongoose.Schema.Types.ObjectId,
    required: true
  },
  Stud_ID: {
    type: mongoose.Schema.Types.ObjectId,
    required: true
  },
  Asmt_file: {
    type: File,
    default: false,
    required: true
  },
  Date: {
    type: Date,
    default: false,
    required: true
  },
  Is_Active: {
    type: Boolean,
    default: false,
    required: true
  }
});

AssignmentFaculty.plugin(uniqueValidator, {
  message: "Must be Unique."
});

module.exports = mongoose.model("AssignmentFaculty", AssignmentFaculty);
