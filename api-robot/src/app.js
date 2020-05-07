var express        =        require("express");
var bodyParser     =        require("body-parser");
var app            =        express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));


app.get('/login',function(req,res){
    res.sendfile("index.html");
  });

app.get('/', function (req, res) {
  res.send('Hello World')
})

app.post('/auth', function (req, res) {
    var password = req.body.password;
    var email = req.body.email;
    
    console.log("user:"+email +" >>   password:" + password);

    if (password === "hahaha"){
        res.status(200)
        res.send({msg:'Tudo certo, você foi autenticado!'})
    }else{
        res.status(401)
        res.send('')
    }
})
   
  

app.listen(3000,function(){
    console.log("Started on PORT 3000");
  })