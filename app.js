const cors = require('cors')

var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan'); 


var usersRouter = require('./routes/users');
var weeksRouter = require('./routes/weeks');
var photosRouter = require('./routes/photos');
var authRouter = require('./routes/auth')

var app = express();

app.use(cors());
app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

// Serve static files from the React frontend app
app.use(express.static(path.join(__dirname, "client/dist")));

// serve static images from public/img
app.use(express.static("public"));


app.use('/users', usersRouter);
app.use('/weeks', weeksRouter);
app.use('/photos', photosRouter);
app.use('/auth', authRouter);

// Anything that doesn't match the above, send back index.html
app.get("*", (req, res) => {
  res.sendFile(path.join(__dirname + "/client/dist/index.html"));
});

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.send("error");
});


/*app.use(cors())

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

app.use(express.static('public'));
app.use(express.static(path.join(__dirname, 'public')));*/


module.exports = app;
