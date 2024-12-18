// importing modules
const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

const app = express();
const port = process.env.PORT || 3000;
const server = http.createServer(app);
const Room = require("./models/room");
const socketIO = require("socket.io");

// middleware
app.use(express.json());

const DB =
  "mongodb+srv://parth_darji:test123@cluster0.ziwu1.mongodb.net/?retryWrites=true&w=majority";

mongoose
  .connect(DB)
  .then(() => {
    console.log("Mongoose connection successful");
  })
  .catch((e) => {
    console.error("Database connection error:", e);
    process.exit(1); // Exit if database connection fails
  });

server.listen(port, "0.0.0.0", () => {
  console.log(`Server running on port:${port}`);
});

const io = socketIO(server);

io.on("connection", (socket) => {
  console.log("A user connected");

  socket.on("createRoom", async ({ nickname }) => {
    try {
      const room = new Room();
      const player = {
        socketId: socket.id,
        nickname,
        playerType: "X",
      };

      room.players.push(player);
      room.turn = player;
      const savedRoom = await room.save();

      const roomId = savedRoom._id.toString();
      socket.join(roomId);

      io.to(roomId).emit("createRoomSuccess", savedRoom);
    } catch (e) {
      console.error("Error in createRoom:", e);
      socket.emit("errorOccurred", "Failed to create room. Please try again.");
    }
  });

  socket.on("joinRoom", async ({ nickname, roomId }) => {
    try {
      if (!roomId.match(/^[0-9a-fA-F]{24}$/)) {
        socket.emit("errorOccurred", "Invalid Room ID.");
        return;
      }

      const room = await Room.findById(roomId);

      if (room && room.isJoin) {
        const player = {
          nickname,
          socketId: socket.id,
          playerType: "O",
        };

        room.players.push(player);
        room.isJoin = false;
        const updatedRoom = await room.save();

        socket.join(roomId);

        io.to(roomId).emit("joinRoomSuccess", updatedRoom);
        io.to(roomId).emit("updatePlayers", updatedRoom.players);
        io.to(roomId).emit("updateRoom", updatedRoom);
      } else {
        socket.emit("errorOccurred", "Room is not available for joining.");
      }
    } catch (e) {
      console.error("Error in joinRoom:", e);
      socket.emit("errorOccurred", "Failed to join room. Please try again.");
    }
  });

  socket.on("tap", async ({ index, roomId }) => {
    try {
      // Fetch the room details
      let room = await Room.findById(roomId);

      console.log(`index: ${index}`);
      console.log(`roomId: ${roomId}`);
      console.log(`room: ${room}`);

      if (!room) {
        throw new Error(`Room with ID ${roomId} not found`);
      }

      // Determine the player's choice ('x' or 'o')
      const choice = room.turn.playerType;

      // Update the turn and turnIndex
      if (room.turnIndex === 0) {
        room.turn = room.players[1];
        room.turnIndex = 1;
      } else {
        room.turn = room.players[0];
        room.turnIndex = 0;
      }

      // Save the updated room state
      await room.save();

      // Emit the updated room state to all clients in the room
      io.to(roomId).emit("tapped", {
        index,
        choice,
        room,
      });
    } catch (e) {
      console.error(`Error processing tap event: ${e.message}`);
    }
  });

  socket.on("disconnect", () => {
    console.log(`User with socket ID ${socket.id} disconnected`);
    // Optionally: Handle room/player cleanup
  });
});
