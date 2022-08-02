import 'package:flutter/cupertino.dart';

abstract class AppScene {
  Widget buildScene();
  void update();
  void reset();
}
