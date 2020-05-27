const mongoose = require("mongoose");
const uniqueValidator = require("mongoose-unique-validator");

const Test_Master = new mongoose.Schema({
    Test_Name: {
        type: String,
        required: true,
        unique: true
    },
    Is_Active: {
        type: Boolean,
        default: false,
        required: true
    },
    Is_Finished: {
        type: Boolean,
        default: false,
    },
    Faculty_ID: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,
        ref: "Faculty"
    },
    Course_ID: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,
        ref: "Course"
    },
    Subject_ID: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,
        ref: "Subject"
    },
    Created_On: {
        type: Date,
        default: Date.now,
        required: true
    }
});

Test_Master.plugin(uniqueValidator, {
    message: "Must be Unique."
});

module.exports = mongoose.model("Test_Master", Test_Master);
