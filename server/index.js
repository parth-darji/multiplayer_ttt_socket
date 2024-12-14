// importing modules
const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
const Room = require("./models/room");
var io = require("socket.io")(server);

// middleware
// e.g. client -> middleware -> server
app.use(express.json());

// Promise in Javascript = Future in Dart
const DB =
  "mongodb+srv://parth_darji:test123@cluster0.ziwu1.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

io.on("connection", (socket) => {
  console.log("connected!");
  socket.on("createRoom", async ({ nickname }) => {
    console.log(`nickname: ${nickname}`);

    // room is created
    try {
      let room = new Room();

      // player is stored in the room
      let player = {
        socketId: socket.id,
        nickname: nickname,
        playerType: "X",
      };
      room.players.push(player);
      room.turn = player;
      room = await room.save();
      console.log(`room: ${room}`);
      const roomId = room._id.toString();
      socket.join(roomId);

      // tell the client that room has been created
      // so go to next page

      io.to(roomId).emit("createRoomSuccess", room);
    } catch (e) {
      console.log(e);
    }
  });

  socket.on("joinRoom", async ({ nickname, roomId }) => {
    try {
      if (!roomId.match(/^[0-9a-fA-F]{24}$/)) {
        socket.emit("errorOccurred", "Please enter a valid Room ID.");
        return;
      }

      let room = await Room.findById(roomId);

      if (room.isJoin) {
        let player = {
          nickname,
          socketId: socket.id,
          playerType: "O",
        };
        socket.join(roomId);
        room.players.push(player);
        room = await room.save();

        io.to(roomId).emit("joinRoomSuccess", room);
      } else {
        socket.emit(
          "errorOccurred",
          "The game is in progress, try again later."
        );
      }
    } catch (e) {
      console.log(e);
    }
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
