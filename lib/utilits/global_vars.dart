import 'package:starship_troopers_game/scenes/app_scene.dart';
import 'package:starship_troopers_game/scenes/geme_scene.dart';
import 'package:starship_troopers_game/scenes/home_scene.dart';

class GlobalVars {
  static AppScene gameScene = GameScene();
  static AppScene homeScene = HomeScene();
  static double screenWidth = 0;
  static double screenHeight = 0;
  static bool bHomeScene = true;
  static bool bGameScene = false;
}
