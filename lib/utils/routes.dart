import 'package:flutter_ttt_socket/screens/create_room_screen.dart';
import 'package:flutter_ttt_socket/screens/join_room_screen.dart';

import '../screens/main_menu_screen.dart';

final routes = {
  MainMenuScreen.routeName: (context) => const MainMenuScreen(),
  CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
  JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
};
