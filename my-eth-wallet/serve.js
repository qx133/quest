var express = require('express');
var app = express();

//setting middleware
app.use(express.static(__dirname+'/public')); //Serves resources from public folder

var server = app.listen(5000);

console.log('http://localhost:5000/index-metamask.html');
