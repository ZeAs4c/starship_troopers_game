import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'game_core/game.dart';
import 'game_core/main_loop.dart';

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
        home: Game()));
  }); // SystemChrome - позволяет обращаться к низко-уровневым библам, устанавливаем наше приложение в горизонтальный вид
  // Так как setPreferredOrientations работает в ассинхронном режиме, то с помощью whenComplete, скажем чтобы runApp выполнялась после
  // переворота экрана в горизонтальный вид
}
