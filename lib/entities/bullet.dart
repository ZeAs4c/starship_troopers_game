import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'package:starship_troopers_game/entities/entity.dart';
import 'package:starship_troopers_game/utilits/global_vars.dart';

class Bullet extends Entity {
  final double playerAngle;
  double _speed = 6;
  Bullet(
      {required this.playerAngle,
      required double playerX,
      required double
          playerY}) // required - показывает компилятору что в значения нельзя передать null
      : super("bullet") {
    x = playerX;
    y = playerY;
  }

  @override
  Widget build() {
    return Positioned(
      top: y,
      left: x,
      child: Transform.rotate(
        angle: playerAngle,
        child: sprites[currentSprite],
      ),
    );
  }

  @override
  void move() {
    x += sin(playerAngle) * _speed;
    y -= cos(playerAngle) * _speed;
    if (x > GlobalVars.screenWidth ||
        y > GlobalVars.screenHeight ||
        x < 0 ||
        y < 0) {
      visible = false;
    }
  }

  void reset() {
    // TODO: implement reset
  }
}
