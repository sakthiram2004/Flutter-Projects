const CategoryModel = require("./../models/category_model")

const categoryController = {
    createCategory:async function(req,res){
        try{
            
            const categoryDate = req.body;
            const newCategory = new CategoryModel(categoryDate);
            await newCategory.save();

            return res.json({
                success:true,
                data:newCategory,
                message:"category is created"
            });
        }
        catch(err){
            console.log(err);
            return res.json({success:false,message:err});
        }
    },

    fetchAllCategories: async function(req,res){
        try{
            const categories = await CategoryModel.find();
            return res.json({success:true,
                data:categories,
                message:"categories is fetched"
            });
        }
        catch(error){
            return res.json({success:false,message:error});
        }
    },

    fetchCategoriesById: async function(req,res){
        try{
            const id = req.params.id;
            const foundcategories = await CategoryModel.findById(id);
            
            if(!foundcategories){
                return res.json({success:false,
                
                    message:"categories is not founded"
                });
            }
            
            return res.json({success:true,
                data:foundcategories,
                message:"categories is founded"
            });
        }
        catch(error){
            console.log(error);
            return res.json({success:false,message:error});
        }
    }
}
module.exports= categoryController;