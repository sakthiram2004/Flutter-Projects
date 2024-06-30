const mongoose= require("mongoose");

const catogory = mongoose.model(
    "Category",
    mongoose.Schema(
        {
            categoryName:{
                type:String,
                require:true,
                unique:true,
            },

            categoryDiscriptionP:{
                type:String,
                unique:true,
            },
            categoryImage:{
                type:String
            }
        }
    )
);

module.exports=catogory;