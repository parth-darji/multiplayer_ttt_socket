# Multiplayer Tic Tac Toe Game

A multiplayer Tic Tac Toe game app built with Flutter for the front-end and Node.js with Express and Socket.io for the back-end. This full-stack project demonstrates real-time gameplay using WebSocket technology.

## Demo

![Demo](demo.gif)

## Features

- **Real-Time Multiplayer Gameplay:** Play Tic Tac Toe with opponents in real time.
- **WebSocket Communication:** Seamless communication using Socket.io.
- **Modern UI:** Built with Flutter, providing a smooth and responsive user experience.
- **Backend with Node.js:** Scalable and efficient server-side code.
- **Cross-Platform Support:** Available on both Android and iOS.

## Tech Stack

### Front-End

- **Framework:** Flutter
- **Language:** Dart

### Back-End

- **Framework:** Express.js
- **Language:** JavaScript (Node.js)
- **Real-Time Communication:** Socket.io
- **Database:** MongoDB

## Prerequisites

Before starting, ensure you have the following installed:

- **Flutter SDK**: [Installation Guide](https://flutter.dev/docs/get-started/install)
- **Node.js**: Latest LTS version. [Download Node.js](https://nodejs.org/)
- **MongoDB**: A running MongoDB instance for storing data.

### Current Versions Used

- **Node.js**: v20.13.1
- **NPM**: v10.5.2

---

## Steps to Run

### 1. Update Wi-Fi IP Address

1. Find your system's Wi-Fi IP address from the connected Wi-Fi settings.
2. Open the `lib/resources/socket_client.dart` file.
3. Replace the IP placeholder with your current Wi-Fi IP.

### 2. Back-End Setup

1. Navigate to the `server` folder:

   ```
   cd server
   ```

2. (Optional) Update the MongoDB connection URL:

   1. Open index.js in the server folder.
   2. Replace the MongoDB URL with your own MongoDB instance if needed.

3. Install dependencies:

   ```
   npm install
   ```

4. Start the server in development mode:
   ```
   npm run dev
   ```

### 3. Front-End Setup

1.  Go back to the root of the project.
2.  Install Flutter dependencies:

    ```
    flutter pub get
    ```

3.  Run the app:

    ```
    flutter run
    ```

4.  Testing the App

    1. Run the project on two devices (physical or emulators).
    2. Both devices should be connected to the same Wi-Fi network.
    3. Test the real-time gameplay functionality.

## Troubleshooting

### 1. Server not starting?

- Ensure Node.js and NPM are correctly installed.
- Check your MongoDB instance and update the URL in index.js.

### 2. WebSocket connection failing?

- Double-check the Wi-Fi IP address in lib/resources/socket_client.dart.

### 3. App not connecting to the server?

- Ensure both devices are connected to the same Wi-Fi network.

## Contributing

Contributions are welcome! To contribute:

1.  Fork the repository.

2.  Create a new branch (git checkout -b feature/your-feature-name).

3.  Commit your changes (git commit -m 'Add your message here').

4.  Push the branch (git push origin feature/your-feature-name).

5.  Open a Pull Request.
