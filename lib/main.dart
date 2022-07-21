import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starship_troopers_game/utilits/global_vars.dart';

import 'game_core/game.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // Настройка правильной иницилизации виджетов
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .whenComplete(() {
    SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.bottom // скрываем строку состояний
    ]);
    SystemChrome.setEnabledSystemUIOverlays(
        []); // скрываем нижнюю панель андроид

    runApp(MaterialApp(
        debugShowCheckedModeBanner:
            false, // Убираем банер в правом верхнем углу
        home: SafeArea(
          child: Scaffold(
            body: MyApp(),
          ),
        ) // Поможет нам использовать только безопасную часть нашего экрана
        ));
  }); // SystemChrome - позволяет обращаться к низко-уровневым библам, устанавливаем наше приложение в горизонтальный вид
  // Так как setPreferredOrientations работает в ассинхронном режиме, то с помощью whenComplete, скажем чтобы runApp выполнялась после
  // переворота экрана в горизонтальный вид
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    initGame(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.cover)),
        child: Game());
  }

  void initGame(BuildContext context) {
    GlobalVars.screenWidth = MediaQuery.of(context).size.width;
    GlobalVars.screenHeight = MediaQuery.of(context).size.height;
  }
}
