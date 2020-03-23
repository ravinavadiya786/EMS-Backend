const mongoose = require("mongoose");
const uniqueValidator = require("mongoose-unique-validator");

const Event = new mongoose.Schema({
  title: {
    type: String,
    required: true
  },
  Desc: {
    type: String
  },
  start: {
    type: String,
    required: true
  },
  end: {
    type: String,
    required: true
  },
  color : {
    primary: {
      type : String,
    },
    secondary:{
      type : String,
    },
  }
});
Event.plugin(uniqueValidator, {
  message: "Must be Unique."
});

module.exports = mongoose.model("Event", Event);
