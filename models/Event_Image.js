const mongoose = require("mongoose");
const uniqueValidator = require("mongoose-unique-validator");

const EventImage= new mongoose.Schema({
  Event_Img_ID: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    unique: true
  },
  Event_ID  : {
    type: mongoose.Schema.Types.ObjectId,
    required: true
  },

  Event_Img_Path: {
    type: String,
    required: true
  },
  Is_Active: {
    type: Boolean,
    required: true
  }
});
EventImage.plugin(uniqueValidator, {
  message: "Must be Unique."
});

module.exports = mongoose.model("EventImage",EventImage);
