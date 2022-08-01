import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utilits/global_vars.dart';
import 'app_scene.dart';

class SettingsScene extends AppScene {
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
              Text(
                '''УПРАВЛЕНИЕ.

Включить/Отключить двигатель -> нажать на правый верхний угол.
Стрелять -> на правый нижний угол. 
Ездить -> на левую сторону свайпами.''',
                maxLines: 5,
                style: TextStyle(color: Colors.red, fontSize: 20),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Container(
                  child: Stack(children: [
                    const Icon(
                      Icons.arrow_back_sharp,
                      size: 50,
                      color: Colors.red,
                    ),
                    GestureDetector(
                      onTap: _backHomeScene,
                    ),
                  ]),
                  width: 50,
                  height: 50,
                ),
                margin: const EdgeInsets.only(bottom: 30),
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

  void _backHomeScene() {
    GlobalVars.bHomeScene = true;
    GlobalVars.bSettingsScene = false;
  }
}
