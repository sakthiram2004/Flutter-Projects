const categoryRouter = require("express").Router();
const categoryController = require('./../controllers/categoty_controller');

categoryRouter.post("/",categoryController.createCategory);
categoryRouter.get("/:id",categoryController.fetchCategoriesById);
categoryRouter.get("/",categoryController.fetchAllCategories);
module.exports = categoryRouter;