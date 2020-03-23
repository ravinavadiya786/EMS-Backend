const mongoose = require("mongoose");
const uniqueValidator = require("mongoose-unique-validator");

const Course = new mongoose.Schema({
  Course_Name: {
    type: String,
    required: true,
    unique: true
  },
  Duration: {
    type: String,
    required: true
  },
  Is_Active: {
    type: Boolean,
    default: true,
    required: true
  },
  Created_On: {
    type: Date,
    default: Date.now,
    required: true
  }
});

Course.plugin(uniqueValidator, {
  message: "Must be Unique."
});

module.exports = mongoose.model("Course", Course,"Course");
