const { strict } = require("assert");
const mongoose = require("mongoose");
const { type } = require("os");
const { title } = require("process");

const NoteSchemas = mongoose.Schema({
    id:{
        type:String,
        unique:true,
        required:true
    },
    userid:{
        type:String,
        require:true
    },
    title:{
        type:String,
        require:true
    },
    content:{
        type:String,
    },
    dateadded:{
        type:Date,
        default:Date.now,
    }
});

module.exports = mongoose.model("Notes",NoteSchemas);