
const mongoose = require("mongoose");
const DB = "mongodb+srv://sangram31200431:Sangram31@cluster1.mmrrxhf.mongodb.net/?retryWrites=true&w=majority";



mongoose.connect(DB).then(()=>{
    console.log("connected to database");
})
const login = new  mongoose.Schema({

    email:{
        type:String,
        required:true,

    },
    
    password:{
        type:String,
        required:true,

    }
    ,
    token:{
        type:Boolean,
        required:true,

    }
})


const User = mongoose.model("Stateperistance",login);
module.exports=User;