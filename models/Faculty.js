const mongoose = require("mongoose");
const uniqueValidator = require("mongoose-unique-validator");

const Faculty = new mongoose.Schema({
  Course_id: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    ref: "Course"
  },
  email: {
    type: String,
    required: true,
    unique: true
  },
  Name: {
    type: String,
    required: true
  },
  Gender: {
    type: String,
    required: true
  },
  Fname: {
    type: String,
    required: true
  },

  DOB: {
    type: String,
    required: true
  },

  Age: {
    type: Number,
    required: true
  },
  Img_Path: {
    type: String,
    required: true
  },
  Address: {
    address: { type: "String", required: true },
    city: { type: "String", required: true },
    state: { type: "String", required: true },
    pincode: { type: "String", required: true }
  },
  Face_Data: {
    type: Array,
    required: true
  },
  Password: {
    type: String,
    required: true
  },
  PhNo: {
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

Faculty.plugin(uniqueValidator, {
  message: "Must be Unique."
});

module.exports = mongoose.model("Faculty", Faculty);
