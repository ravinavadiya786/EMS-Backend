const mongoose = require("mongoose");
const uniqueValidator = require("mongoose-unique-validator");

const Test_Questions = new mongoose.Schema({
    Question_Name: {
        type: String,
        required: true,
    },
    Answer: {
        type: Array,
        required: true,
    },
    Correct_Ans: {
        type: String,
        required: true,
    },
    Test_Master_ID: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,
        ref: "Test_Master"
    }
});

Test_Questions.plugin(uniqueValidator, {
    message: "Must be Unique."
});

module.exports = mongoose.model("Test_Questions", Test_Questions);
