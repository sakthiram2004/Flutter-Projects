const UserModel = require("./../models/user_model");
const bcrypt= require("bcrypt");
const userController ={
    createAccount:async function(req,res){
        try{
            const userDate = req.body;
            const newUser = new UserModel(userDate);
            await newUser.save();

            return res.json({success:true,message:"user created....."});
        }
        catch(error){
            console.log(error);
            return res.json({success:false,message:error});
        }
    },

    signIn:async function(req,res){
        try {

            const {email,password}=req.body;
            const emailStatus = await UserModel.findOne({email:email});
            if(!emailStatus){
                return res.json({success:false,message:"User Not found"});
            }

            const passwordStatus = bcrypt.compareSync(password,emailStatus.password);
            if(!passwordStatus){
                return res.json({success:false,message:"Incorrect Password"});
            }
            return res.json({
                state:true,
                data:emailStatus,
            });
        }
        catch(error){
            console.log(error);
            return res.json({success:false,message:error});
        }

    }


}
module.exports = userController;