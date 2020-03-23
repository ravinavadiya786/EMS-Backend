const mongoose = require("mongoose");
const uniqueValidator = require("mongoose-unique-validator");

const Division = new mongoose.Schema({
  Course_ID: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    ref:"Course"
  },
  Std_ID: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    ref: "Standard"
  },
  Division_Name: {
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

Division.plugin(uniqueValidator, {
  message: "Must be Unique."
});

module.exports = mongoose.model("Division", Division);
