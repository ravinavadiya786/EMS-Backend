const mongoose = require("mongoose");
const uniqueValidator = require("mongoose-unique-validator");

const Standard = new mongoose.Schema({
  Course_ID: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Course',
    required: true,
  },
  Name: {
    type: String,
    required: true,
    unique: true
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

Standard.plugin(uniqueValidator, {
  message: "Must be Unique."
});

module.exports = mongoose.model("Standard", Standard);
