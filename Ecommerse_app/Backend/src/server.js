const express  = require("express");
const mongoose = require("mongoose");
const helmet = require("helmet");
const morgan = require("morgan");
const cors = require("cors");
const bodyparser = require("body-parser");

const userRouter = require('./../routes/user_routes');
const categoryRouter = require('./../routes/categories_routes');
const productRouter = require("./../routes/product_routes");
const cartRouter = require("./../routes/cart_routes");
const orderRouter = require("./../routes/order_routes")


const app = express();

app.use(morgan("dev"));
app.use(helmet());
app.use(cors());
app.use(bodyparser.json());
app.use(bodyparser.urlencoded({extended:false}));

app.use("/api/user",userRouter);
app.use("/api/categories",categoryRouter);
app.use("/api/product",productRouter);
app.use("/api/cart",cartRouter);
app.use("/api/order",orderRouter);

mongoose.connect("mongodb://localhost:27017/ecommer_app");

app.listen(3000);