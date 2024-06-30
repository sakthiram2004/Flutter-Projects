const cartModel = require("./../models/cart_model");
const CartController={

    getCartForUser:async function (req,res){
        try{
            const user = req.params.user;
            const foundCart = await cartModel.findOne({user:user});
            
            if(!foundCart){
                return res.json({success:false,
                
                    data:[]
                });
            }
            
            return res.json({success:true,
                data:foundCart.items,
                message:"cart is founded"
            });
    }
    catch(error){
        console.log(error);
        return res.json({success:false,message:error});

    }
    
},
    addToCart:async function(req,res){
        try{
            const{product,user,quantity} = req.body;
            const foundCart = await cartModel.findOne({user:user});
            if(!foundCart){
                const newCart = new cartModel({user:user});
                newCart.items.push({
                    quantity:quantity,
                    product:product,
                });
                await newCart.save();
                return res.join({
                    success:true,
                    data:newCart,
                    message:"Product added to cart"
                });
            }
                const updatedcart = await cartModel.findOneAndUpdate(
                    {user:user},
                    {$push:{items:{product:product,quantity:quantity}}},
                    {new :true}

                );
                return res.json({success:true,data:updatedcart,message:"product added to cart"});
        }
        catch(error){
            console.log(error);
            return res.json({success:false,message:error});
    }

    },
    removeFromCart:async function(req,res){
        try{
            const {user,product}=req.body;
            const updatedcart = await cartModel.findOneAndUpdate(
                {user:user},
                {$pull:{items:{product:product}}}

                
            );
            return res.json({
                success:true,
                data:updatedcart,
                message:"Product removed to cart"
            });
        }
        catch(error){
            console.log(error);
            return res.json({success:false,message:error});

        }
    }
}

module.exports= CartController;