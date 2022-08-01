import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utilits/global_vars.dart';
import 'app_scene.dart';

class PauseScene extends AppScene {
  @override
  Widget buildScene() {
    return Stack(children: [
      Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: GlobalVars.screenWidth,
            height: GlobalVars.screenHeight,
            child: Stack(children: [
              Container(
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Продолжить",
                        style: TextStyle(color: Colors.red, fontSize: 40),
                      ),
                    ),
                    GestureDetector(
                      onTap: _resumeGame_scene,
                    ),
                  ],
                ),
              )
            ]),
            padding: const EdgeInsets.only(left: 30, top: 30),
          )),
    ]);
  }

  @override
  void update() {}

  void _resumeGame_scene() {
    GlobalVars.bGameScene = true;
  }
}
