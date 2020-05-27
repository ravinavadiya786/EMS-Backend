const mongoose = require("mongoose");
const uniqueValidator = require("mongoose-unique-validator");

const Feedback = new mongoose.Schema({
  Fed_ID: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    unique: true
  },
  Email_ID: {
    type: String,
    required: true
  },
  Desc: {
    type: String,
    required: true
  },
  Date: {
    type: Date,
    required: true
  },
  Is_active: {
    type: String,
    default: false,
    required: true
  }
});

Feedback.plugin(uniqueValidator, {
  message: "Must be Unique."
});

module.exports = mongoose.model("Feedback", Feedback);
