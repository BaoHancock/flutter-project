const express = require("express");
const router = express.Router();
const mong = require("../models/login");
const check = require("./check");
router.post("/login",async(req,res)=>{
try{
    const {email,password,token}=req.body;
    const found =await  mong.findOne({email});
    console.log(found.password);
    console.log(password);
    
    if(found.email == email){
        if(password == found.password){

            //  const got =await    mong.updateOne({email:found.email},{$set:{token:"true"}});
            console.log("up");
            const gotta = await mong.findOneAndUpdate({email:found.email},{token:true,email:found.email});
           
           return res.json(gotta);
          
          
        }
        return res.json({msg:"invalid password"});

        
    }
    return res.json({msg:"invalid email"});
    
  
 
}catch(e){
res.json({msg:e.mee})
}
})



router.post("/entry",async(req,res)=>{
  try{
    
    const {email,password}= req.body;
   
    console.log(email,password);
    let user = new  mong({
        email,
        password,
        token:false
    })
    user = await user.save();
    console.log(user);
    res.json(user);

  }catch(e){
    res.json({msg:e.message});
  }
})



router.get("/checkandget",check,async(req,res)=>{
    const user = req.user;
    
    console.log(user.body);
    res.json({msg:req.user});
  
})
router.post("/signout",async(req,res)=>{
  const {email}=req.body;
  const gotta = await mong.findOneAndUpdate({email:email},{token:false,email:email});
  res.json(gotta);

})
module.exports = router;