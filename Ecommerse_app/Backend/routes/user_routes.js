const userRouter = require("express").Router();
const userController = require("./../controllers/user_controller");
userRouter.post("/createAccount",userController.createAccount)
userRouter.post("/signIn",userController.signIn);
module.exports=userRouter;