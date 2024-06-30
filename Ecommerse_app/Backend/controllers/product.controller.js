const ProductModel = require("../models/product_module");

const ProductController ={
    createProduct:async function(req,res){
        try{
            
            const productDate = req.body;
            const newProduct = new ProductModel(productDate);
            await newProduct.save();

            return res.json({
                success:true,
                data:newProduct,
                message:"Product is created"
            });
        }
        catch(err){
            console.log(err);
            return res.json({success:false,message:err});
        }
    },

    fetchAllProduct:async function(req,res){
        try{
            const product = await ProductModel.find();
            return res.json({success:true,data:product});
        }
        catch(error){
            return res.json({success:true,
                message:error
            });
        }
    },
    fetchProductByCategory:async function(req,res){
        try{
            const categoryid = req.params.id;
            const product = await ProductModel.find({category:categoryid});
            return res.json({success:true,data:product});
        }
        catch(error){
            return res.json({success:true,
                message:error
            });
        }

    }

}

module.exports=ProductController;