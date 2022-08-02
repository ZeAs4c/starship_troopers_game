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
            child: Stack(
              children: [
                Container(
                    alignment: Alignment.topCenter,
                    child: Stack(children: [
                      Container(
                        child: Stack(
                          children: [
                            const Text(
                              "Продолжить",
                              style: TextStyle(color: Colors.red, fontSize: 40),
                            ),
                            GestureDetector(
                              onTap: _resumeGame_scene,
                            ),
                          ],
                        ),
                        height: 50,
                        width: 240,
                        //color: Colors.red,
                      )
                    ])),
                Container(
                    alignment: Alignment.center,
                    child: Stack(children: [
                      Container(
                        child: Stack(
                          children: [
                            const Text(
                              "В главное меню",
                              style: TextStyle(color: Colors.red, fontSize: 40),
                            ),
                            GestureDetector(
                              onTap: _resumeHome_scene,
                            ),
                          ],
                        ),
                        height: 50,
                        width: 305,
                        //color: Colors.red,
                      )
                    ])),
              ],
            ),
            padding: const EdgeInsets.only(left: 30, top: 30),
          )),
    ]);
  }

  @override
  void update() {}

  void _resumeGame_scene() {
    GlobalVars.bGameScene = true;
    GlobalVars.bPauseScene = false;
  }

  void _resumeHome_scene() {
    GlobalVars.bGameScene = false;
    GlobalVars.bHomeScene = true;
    GlobalVars.bPauseScene = false;
    GlobalVars.gameScene.reset();
  }

  @override
  void reset() {
    // TODO: implement reset
  }
}
