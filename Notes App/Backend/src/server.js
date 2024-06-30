const { error } = require("console");
const express = require("express");
const app = express();
const mongoose = require("mongoose");
const Note = require("../model/Note");
const noteRouter=require("../routes/Notes")
const bodyparser = require("body-parser");
app.use(bodyparser.urlencoded({extended:false}))
app.use(bodyparser.json());
app.use("/notes",noteRouter);
mongoose.connect("mongodb://localhost:27017/notes_app",).then(()=>{

}).catch((error)=>{
    console.log(error);
})



app.listen(3000);