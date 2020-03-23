const mongoose = require("mongoose");
const uniqueValidator = require("mongoose-unique-validator");

const Facultysub = new mongoose.Schema({
  Faculty_ID: {
    type: mongoose.Schema.Types.ObjectId,
    required: true
  },
  Sub_ID: {
    type: mongoose.Schema.Types.ObjectId,
    required: true
  },
  Division_ID: {
    type: mongoose.Schema.Types.ObjectId,
    required: true
  },
  Assigned_By: {
    type: String,
    default: false,
    required: true
  }
});

Facultysub.plugin(uniqueValidator, {
  message: "Must be Unique."
});

module.exports = mongoose.model("Facultysub", Facultysub);
