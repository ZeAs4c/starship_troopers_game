import 'dart:isolate';

bool _running = true;

void mainLoop(SendPort sendPort) async {
  final double _fps = 60;
  final double _second = 1000;
  final double _updateTime =
      _second / _fps; // Каждое (результат выражения) милисекнуд обновлять игру

  double _updates = 0;

  Stopwatch _loopWatch = Stopwatch();
  _loopWatch.start(); // Запуск таймера отчета времени для обновления игры

  Stopwatch _timerWatch = Stopwatch();
  _timerWatch.start();

  while (_running) {
    // Условие для проверки, если отсчитал больше n миллисикунд - обновляем игру
    if (_loopWatch.elapsedMilliseconds >= _updateTime) {
      _updates++;
      _loopWatch.reset();
      sendPort.send(
          true); // отправляем булевое значение, что нужно обновить виджеты
    }

    // Для того чтобы смотреть в консоли ФПС и сколько раз происходят апдейты за 1 секунду
    if (_timerWatch.elapsedMilliseconds > _second) {
      print("${DateTime.now()} FPS: $_updates");
      _updates = 0;
      _timerWatch.reset();
    }
  }
}

// Остановка обновлений
void stopLoop() {
  _running = false;
}
