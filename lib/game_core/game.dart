import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:starship_troopers_game/game_core/main_loop.dart';
import 'package:starship_troopers_game/utilits/global_vars.dart';

// Создание класса изменяемых виджетов
class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

// Класс изменения состояний игры
class _GameState extends State<Game> {
  final ReceivePort _receivePort =
      ReceivePort(); // С помощью этой переменной будем принимать данные из мэйн изолята данные, что нам нужно обновиться /Иницилиазация _receivePort
  late final Isolate
      _isolateLoop; //late  для того чтобы показать компилятору, что изолят не может принимать значение null и будет позже проинициализирован

  void _startIsolateLoop() async {
    _isolateLoop = await Isolate.spawn(
        mainLoop,
        _receivePort
            .sendPort); // Инициализация Isolate главным изолятом и портом
    _receivePort.listen((message) {
      GlobalVars.gameScene.update();

      setState(() {});
    }); // Принимаем сообщение по порту, что нужно обновиться
  }

  void initState() {
    _startIsolateLoop();
    super.initState();
  }

  @override
  void dispose() {
    _receivePort.close();
    _isolateLoop.kill();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (GlobalVars.bHomeScene) {
      return GlobalVars.homeScene.buildScene();
    } else if (GlobalVars.bSettingsScene) {
      return GlobalVars.settingScene.buildScene();
    } else if (GlobalVars.bGameScene) {
      return GlobalVars.gameScene.buildScene();
    } else {
      return GlobalVars.homeScene.buildScene();
    }
  }
}
