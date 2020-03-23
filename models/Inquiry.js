const mongoose = require("mongoose");
const uniqueValidator = require("mongoose-unique-validator");

const Inquiry = new mongoose.Schema({
    Inquiry_ID: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    unique: true
  },
  Faculty_ID: {
    type:mongoose.Schema.Types.ObjectId,
    required: true
  },
  Stud_ID: {
    type: mongoose.Schema.Types.ObjectId,
    default: false,
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
 
  Status: {
    type: String,
    default: false,
    required: true
  },
  
  Reply_desc: {
    type: String,
    default: false,
    required: true
  },
  Reply_date: {
    type: Date,
    default: false,
    required: true
  }
});

Inquiry.plugin(uniqueValidator, {
  message: "Must be Unique."
});

module.exports = mongoose.model("Inquiry",Inquiry);
