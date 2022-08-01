import 'package:flutter/material.dart';
import 'package:starship_troopers_game/scenes/app_scene.dart';
import 'package:starship_troopers_game/utilits/global_vars.dart';

import '../entities/bullet.dart';
import '../entities/player.dart';

class GameScene extends AppScene {
  Player _player = Player();
  double _startGlobalPosition = 0;
  List<Bullet> _listBullets = [];
  List<Widget> _listWidgets = [];

  @override
  Widget buildScene() {
    return Stack(
      children: [
        _player.build(),
        Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: GlobalVars.screenWidth / 2,
              height: GlobalVars.screenHeight,
              child: GestureDetector(
                onPanStart: _onPanStart,
                onPanUpdate: _onPanUpdate,
              ),
            )),
        Positioned(
            top: 0,
            left: GlobalVars.screenWidth / 2,
            child: Stack(
              children: [
                Container(
                    width: GlobalVars.screenWidth / 2,
                    height: GlobalVars.screenHeight / 2,
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: _onAcceleration,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Container(
                            child: Stack(children: [
                              const Icon(
                                Icons.pause,
                                size: 50,
                                color: Colors.red,
                              ),
                              GestureDetector(
                                onTap: _PauseScene,
                              ),
                            ]),
                            width: 50,
                            height: 50,
                          ),
                        )
                      ],
                    )),
              ],
            )),
        Positioned(
            top: GlobalVars.screenHeight / 2,
            left: GlobalVars.screenWidth / 2,
            child: Container(
              width: GlobalVars.screenWidth / 2,
              height: GlobalVars.screenHeight / 2,
              child: GestureDetector(
                onTap: _onShoot,
              ),
            )),
        Stack(
          children: _listWidgets,
        )
      ],
    );
  }

  @override
  void update() {
    _player.update();
    _listWidgets.clear();
    _listBullets.removeWhere((element) => !element.visible);
    _listBullets.forEach((element) {
      _listWidgets.add(element.build());
      element.update();
    });
  }

  GameScene();

  void _onPanStart(DragStartDetails details) {
    _startGlobalPosition = details.globalPosition.dx;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    double updateGlobalPosition = details.globalPosition.dx;
    if (updateGlobalPosition > _startGlobalPosition + 30) {
      _player.isMoveRight = true;
    }
    if (updateGlobalPosition < _startGlobalPosition - 30) {
      _player.isMoveLeft = true;
    }
  }

  // Функция включения и отключения двигателя
  void _onAcceleration() {
    _player.isAcceleration = _player.isAcceleration ? false : true;
  }

  void _onShoot() {
    _listBullets.add(Bullet(
        playerAngle: _player.getAngle,
        playerX: _player.x + 18,
        playerY: _player.y + 18));
  }

  void _PauseScene() {
    GlobalVars.bPauseScene = true;
    GlobalVars.bGameScene = false;
  }
}
