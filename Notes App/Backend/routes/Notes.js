const express = require("express");
const Note = require("../model/Note");
const router = express.Router();

router.get("/",function(req,res){
    res.send("This is Home Page");
});

router.post("/list",async function(req,res){
    var note = await Note.find({userid:req.body.userid});
    res.json(note);
});
router.get("/list/:userid",async function(req,res){
    var note = await Note.find({userid:req.params.userid});
    res.json(note);
});

router.post("/add", async function(req,res){
    
    await Note.deleteOne({id:req.params.id});
    const newNote = Note({
        id:req.body.id,
        userid:req.body.userid,
        title:req.body.title,
        content:req.body.connect
    });
    await newNote.save();
    const response = {message:"new note is added"};
    res.json(req.body);
});

router.post("/delete",async (req,res)=>{
    await Note.deleteOne({id:req.body.id});
    const response = {message:"deleted"};
    res.json(response);
});
module.exports= router;