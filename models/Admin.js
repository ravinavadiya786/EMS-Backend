const mongoose = require("mongoose");
const uniqueValidator = require("mongoose-unique-validator");

const Admin = new mongoose.Schema({
  email: {
    type: String,
    required: true,
    unique: true
  },
  Password: {
    type: String,
    required: true
  }
});

Admin.plugin(uniqueValidator, {
  message: "Must be Unique."
});

module.exports = mongoose.model("Admin", Admin);
