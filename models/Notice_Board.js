const mongoose = require("mongoose");
const uniqueValidator = require("mongoose-unique-validator");

const NoticeBoard= new mongoose.Schema({
  Faculty_ID: {
    type:mongoose.Schema.Types.ObjectId,
    ref: "Faculty"
  },
  Date: {
    type: Date,
    default: Date.now,
    required: true
  },
  Desc: {
    type: String,
    required: true
  },
  Title: {
    type: String,
    required: true
  },
  Is_Active: {
    type: String,
    default: true,
    required: true
  }
});

NoticeBoard.plugin(uniqueValidator, {
  message: "Must be Unique."
});

module.exports = mongoose.model("NoticeBoard",NoticeBoard);
