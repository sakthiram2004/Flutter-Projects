const orderRoutes = require("express").Router();
const orderController = require("./../controllers/order_controller");


orderRoutes.post("/",orderController.createOrder);

orderRoutes.get("/:id ",orderController.fetchOrderForUser);
orderRoutes.put("/update",orderController.updateOrderStatus);
module.exports=orderRoutes;