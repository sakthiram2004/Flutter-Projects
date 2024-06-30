const orderModel = require("./../models/cart_model");
const orderController={

    createOrder:async function (req,res){
        try{
            const {user,items}=req.body;
            const newOrder = new orderModel({
                user:user,
                items:items
            });
            
            const neworder = await newOrder.save();
            return res.json({success:true,
                data:neworder,
                message:"order created"
            });
    }
    catch(error){
        console.log(error);
        return res.json({success:false,message:error});

    }
    
    
},
fetchOrderForUser : async function(req,res){
    try{
        const userid = req.param.userid;
        const foundorder = await orderModel.find({
            "id":userid
        });
        return res.json({
            success:true,
            date:foundorder
        });

    }
    catch(error){
        console.log(error)
        return res.json({
            success:false,
            message:error
        });
    }
},
updateOrderStatus:async function(req,res){
    try{
        const {orderid,status} = req.body;
        const updateOrder = await orderModel.findOneAndUpdate(
            {_id:orderid},{status:status},{new:true}
        );
        return res.json({
            
                success:true,data:updateOrder
            });
        
    }
    catch(error){
        console.log(error)
        return res.json({
            success:false,
            message:error
        });
    }
}
  
}

module.exports= orderController;