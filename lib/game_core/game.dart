import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:starship_troopers_game/game_core/main_loop.dart';
import 'package:starship_troopers_game/utilits/common_vars.dart';

// Создание класса изменяемых виджетов
class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

// Класс изменения состояний игры
class _GameState extends State<Game> {
  double x = 100;
  double y = 200;

  late ReceivePort
      _receivePort; // С помощью этой переменной будем принимать данные из мэйн изолята данные, что нам нужно обновиться
  late Isolate _isolateLoop;

  void startIsolateLoop() async {
    _receivePort = ReceivePort(); // Иницилиазация _receivePort
    _isolateLoop = await Isolate.spawn(
        mainLoop,
        _receivePort
            .sendPort); // Инициализация Isolate главным изолятом и портом
    _receivePort.listen((message) {
      setState(() {});
      x++;
      if (x > 500) {
        x = 0;
      }
    }); // Принимаем сообщение по порту, что нужно обновиться
  }

  @override
  Widget build(BuildContext context) {
    if (isFirstStartGame) {
      startIsolateLoop();
      isFirstStartGame = false;
    }
    return Stack(children: [
      Positioned(top: y, left: x, child: Text("sdsd")),
    ]); //Стек накладывает виджеты в 0-ю точку
  }
}
