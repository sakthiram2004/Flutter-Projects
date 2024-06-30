const CartRouter = require("express").Router();
const CartController = require("./../controllers/cart_controller");

CartRouter.post("/",CartController.addToCart);
CartRouter.get("/:user",CartController.getCartForUser);
CartRouter.delete("/",CartController.removeFromCart);
module.exports=CartRouter;