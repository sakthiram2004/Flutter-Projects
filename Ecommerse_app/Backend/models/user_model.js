const { model, Schema } = require("mongoose");
const uuid = require("uuid");
const bcrypt = require("bcrypt");

const userSchema = new Schema({
    id: { type: String, default: "" },
    fullName: { type: String, default: "" },
    email: { type: String, unique: true, required: true },
    password: { type: String, required: true },
    phoneNumber: { type: String, default: "" },
    address: { type: String, default: "" },
    city: { type: String, default: "" },
    state: { type: String, default: "" },
    profileProgress: { type: Number, default: 0 },
    updatedOn: { type: Date },
    createdOn: { type: Date }
});

userSchema.pre("save", function(next) {
    this.updatedOn = new Date();
    this.createdOn = new Date();
    next();
});

userSchema.pre(['update', 'findOneAndUpdate', 'updateOne'], function(next) {
    const update = this.getUpdate();
    delete update._id;
    
    this.updatedOn = new Date();
    next();
});

const UserModel = model('User', userSchema);

module.exports = UserModel;
