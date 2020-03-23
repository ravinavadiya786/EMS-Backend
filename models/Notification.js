const mongoose = require("mongoose");
const uniqueValidator = require("mongoose-unique-validator");

const Notification= new mongoose.Schema({
    Notification_ID: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    unique: true
  },
  Faculty_ID: {
    type:mongoose.Schema.Types.ObjectId,
    required: true
  },
  Admin_ID: {
    type: mongoose.Schema.Types.ObjectId,
    required: true
  },
  Date: {
    type: Date,
    required: true
  },
  Desc: {
    type: String,
    default: false,
    required: true
  },
    is_active: {
    type: String,
    default: false,
    required: true
  }
});

Notification.plugin(uniqueValidator, {
  message: "Must be Unique."
});

module.exports = mongoose.model("Notification",Notification);
