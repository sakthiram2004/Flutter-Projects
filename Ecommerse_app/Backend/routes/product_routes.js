const ProductRouter = require("express").Router();
const productController = require('./../controllers/product.controller');

ProductRouter.post("/",productController.createProduct);
ProductRouter.get("/category/:id",productController.fetchProductByCategory);
ProductRouter.get("/",productController.fetchAllProduct);
module.exports = ProductRouter;