// importing modules
const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
var io = require("socket.io")(server);

// middleware
// e.g. client -> middleware -> server
app.use(express.json());

// Promise in Javascript = Future in Dart
const DB =
  "mongodb+srv://parth_darji:test123@cluster0.ziwu1.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

io.on("connection", (socket) => {
  console.log("connected!");
  socket.on("createRoom", ({ nickname }) => {
    console.log(`nickname: ${nickname}`);

    // room is created
    // player is stored in the room
    // player is taken to the next screen
  });
});

mongoose
  .connect(DB)
  .then(() => {
    console.log("Mongoose connection successful");
  })
  .catch((e) => {
    console.log(e);
  });

server.listen(port, "0.0.0.0", () => {
  console.log(`Server started and running on port:${port}`);
});
