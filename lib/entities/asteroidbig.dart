import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:starship_troopers_game/utilits/global_vars.dart';

import 'entity.dart';

class AsteroidBig extends Entity {
  AsteroidBig() : super("asteroidbig") {
    randomNum = rng.nextInt(4);
    switch (randomNum) {
      case 0:
        x = (GlobalVars.screenWidth / 2) + rng.nextInt(50).toDouble();
        y = (GlobalVars.screenHeight / 2) - rng.nextInt(50).toDouble();
        break;
      case 1:
        x = (GlobalVars.screenWidth / 2) - rng.nextInt(50).toDouble();

        y = (GlobalVars.screenHeight / 2 / 2) + rng.nextInt(50).toDouble();

        break;
      case 2:
        x = (GlobalVars.screenWidth / 2) + rng.nextInt(50).toDouble();
        y = (GlobalVars.screenHeight / 2 / 2) + rng.nextInt(50).toDouble();
        break;
      case 3:
        x = (GlobalVars.screenWidth / 2 / 2) - rng.nextInt(50).toDouble();
        y = (GlobalVars.screenHeight / 2 / 2) - rng.nextInt(50).toDouble();
        break;
    }
  }

  var rng = Random();
  double _angleAs = 0; // Угол
  double _degreeAs = 0; // Градусы
  double _speedAs = 2;
  int randomNum = 0;

  @override
  Widget build() {
    return Positioned(
        top: y,
        left: x,
        child: visible
            ? Transform.rotate(
                angle: _angleAs,
                child: sprites[currentSprite],
              )
            : SizedBox());
  }

  @override
  void move() {
    _degreeAs = rng.nextInt(3.5.toInt()).toDouble();
    _angleAs = (_degreeAs * 3.14) / 180;
    switch (randomNum) {
      case 0:
        x += sin(_degreeAs) * _speedAs;
        y -= cos(_degreeAs) * _speedAs;

        break;
      case 1:
        x -= sin(_degreeAs) * _speedAs;
        y += cos(_degreeAs) * _speedAs;
        break;
      case 2:
        x += sin(_degreeAs) * _speedAs;
        y += cos(_degreeAs) * _speedAs;
        break;
      case 3:
        x -= sin(_degreeAs) * _speedAs;
        y -= cos(_degreeAs) * _speedAs;

        break;
    }

    if (x > GlobalVars.screenWidth + 50) {
      x = GlobalVars.screenWidth - GlobalVars.screenWidth;
    }
    if (y > GlobalVars.screenHeight + 50) {
      y = GlobalVars.screenHeight - GlobalVars.screenHeight;
    }
    if (x < 0 - 50) {
      x = GlobalVars.screenWidth;
    }
    if (y < 0 - 50) {
      y = GlobalVars.screenHeight;
    }
  }
}
