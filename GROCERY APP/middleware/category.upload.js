const multer = require("multer");
const path = require("path");
const { parseArgs } = require("util");

const storage = multer.diskStorage({
    destination:function(req,file,cb){
        cb(null,"./uploads/categories");
    },
    filename:function(req,file,cb){
        cb(null,Date.now()+"-"+file.originalname);
    }
});

const fileFilter = (req,file,callback)=>{
    const acceptableExt =[".png",".jpg","jpreg"];
    if(!acceptableExt.includes(path.extname(file.originalname))){
        return callback(new Error("only .png .jpg .jpeg format allowed!"));

    }
    const fileSize = parseInt(req.headers["content-length"]);

    if(fileSize > 1048576){
        return callback(new Error("File Size Big"));

    }
    callback(null,true);
};

let uploads = multer({
    storage:storage,
    fileFilter:fileFilter,
    fileSize: 1048576,
});

module.export = upload.