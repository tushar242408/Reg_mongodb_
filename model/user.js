const mongoose = require("mongoose");
const User= mongoose.Schema({
name: String,
password: String,
});

module.exports= mongoose.model("user", User)