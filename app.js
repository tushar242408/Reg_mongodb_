const express = require("express");
const mongoose = require("mongoose");
const User= require("./model/user")
require("dotenv/config");
const app=express({extended: false});

app.use(express.json());

app.post("/createuser", async (req,res)=>{
console.log(req.body.name);
try{

const myuser= new User(req.body);
console.log(req.body.name);
await myuser.save;
console.log(req.body.name);

res.send(myuser);
}catch (err){
res.send("message"+err);
}

})

mongoose.connect(process.env.DB_CONNECTION_STRING,
{ useNewUrlParser: true },(req,res)=>{
console.log("ghjkuhgh");
console.log(process.env.DB_CONNECTION_STRING);
})
app.listen(3000,()=>{
console.log("listening to 3000 ");
});


