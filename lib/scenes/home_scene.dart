import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:starship_troopers_game/game_core/game.dart';
import 'package:starship_troopers_game/scenes/app_scene.dart';
import 'package:starship_troopers_game/utilits/global_vars.dart';

class HomeScene extends AppScene {
  Game hh = Game();
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
              const Text(
                "Звездный десант",
                style: TextStyle(color: Colors.red, fontSize: 40),
              ),
              Container(
                child: Stack(children: [
                  const Text("Старт",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 40,
                      )),
                  GestureDetector(
                    onTap: _bstarGame,
                  ),
                ]),
                width: 120,
                height: 50,
                margin: const EdgeInsets.only(left: 0, top: 60),
              ),
              Container(
                child: Stack(children: [
                  const Text("Управление",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 40,
                      )),
                  GestureDetector(
                    onTap: _bstarSettings,
                  ),
                ]),
                width: 240,
                height: 50,
                //color: Colors.red,
                margin: const EdgeInsets.only(left: 0, top: 120),
              ),
            ]),
            padding: const EdgeInsets.only(left: 30, top: 30),
          )),
    ]);
  }

  @override
  void update() {
    // TODO: implement update
  }

  void _bstarGame() {
    GlobalVars.bGameScene = true;
    GlobalVars.bHomeScene = false;
  }

  void _bstarSettings() {
    GlobalVars.bHomeScene = false;
    GlobalVars.bSettingsScene = true;
  }
}
