const express = require("express");
const app = express();
const mongoose = require("mongoose");
const {MONGOOSE_DB_CONFIG}= require("./config/app.config");
const errors = require("./middleware/errors.js");
const swaggerUi = require("swagger-ui-express"),swaggerDocument = require("./swagger.json");

mongoose.Promise = global.Promise;

mongoose.connect(
    MONGOOSE_DB_CONFIG.DB,
    {
        useNewUrlParser:true,
        useUnifiedTopology:true
    }
).then(()=>{
    console.log("connected")
},
(err)=>{
    console.log(err)
});

app.use("express.json()");
app.use("/uploads",express.static("uploads"))
app.use("/api",require("./routers/app.routes"));
app.use(errors.errorHandler);
app.use("/api-docs",swaggerUi.serve,swaggerUi.setup(swaggerDocument));
app.listen(3000,()=>{
    console.log("connected");
})