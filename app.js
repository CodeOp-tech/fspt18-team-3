const cors = require('cors')

var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');


var usersRouter = require('./routes/users');
var weeksRouter = require('./routes/weeks');
var photosRouter = require('./routes/photos');

var app = express();

app.use(cors())

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));


app.use('/users', usersRouter);
app.use('/weeks', weeksRouter);
app.use('/photos', photosRouter);

module.exports = app;
