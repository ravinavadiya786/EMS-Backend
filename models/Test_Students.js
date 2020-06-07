const mongoose = require("mongoose");
const uniqueValidator = require("mongoose-unique-validator");

const Test_Students = new mongoose.Schema({
    Score: {
        type: String,
        required: true,
    },
    WrongAnsCnt: {
        type: String,
        required: true,
    },
    Student_ID: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,
        ref: "Student"
    },
    Test_Master_ID: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,
        unique: true,
        ref: "Test_Master"
    },
    Completed_Date: {
        type: Date,
        default: Date.now,
        required: true
    }
});

Test_Students.plugin(uniqueValidator, {
    message: "Must be Unique."
});

module.exports = mongoose.model("Test_Students", Test_Students);
