const { response } = require("express");
const catogory = require("../models/category.model");
const {Category} = require("../models/category.model");

async function createCategory(params,callback){
    if(!params.categoryName){
        return callback(
            {message:"category name required",

            },""
        );
    }

    const model = new catogory(params);
    model.save().then((response)=>
   { return callback(null,response);}).catch((error)=>{
    return callback(error);
   });

}

async function getCategories(params,callback){
    const categoryName = params.categoryName;

    var condition = categoryName?{categoryName:{$regex:new RegExp(categoryName),$options:'i'},
}:{};
let perPage = Math.abs(params.perSize)|| MONGO_DB_CONFIG.pageSize
let page = (Math.abs(params.page)||1)-1;

Category.find(condition,"categoryName categoryImage")
.limit(perPage)
.skip(perPage * page);


}


async function getCategoryById(params,callback){
    const categoryId = params.categoryId;

    catogory.findById(categoryId)
    .then((response)=>{
        if(!response)callback("Not Found Category with Id",+categoryId)
            else callback(num,response);
    })
    .catch((error)=>{
        return callback(error);
    });
}

async function getCategoryById(params,callback){
    const categoryId = params.categoryId;

    catogory.findById(categoryId)
    .then((response)=>{
        if(!response)callback("Not Found Category with Id",+categoryId)
            else callback(num,response);
    })
    .catch((error)=>{
        return callback(error);
    });
}


async function updateCategory(params,callback){
    const categoryId = params.categoryId;
    Category.findByIdAndUpdate(categoryId,params,{useFindAndModify:false})
    .then((response)=>{
        if(!response) callback("not found category id"+ categoryId);
        else callback(null,response);
    })
    .catch((error)=>{return callback(error)})
}


async function deleteCategory(params,callback){
    const categoryId = params.categoryId;
    Category.findByIdAndDelete(categoryId)
    .then((response)=>{
        if(!response) callback("not found category id"+ categoryId);
        else callback(null,response);
    })
    .catch((error)=>{return callback(error)})
}
