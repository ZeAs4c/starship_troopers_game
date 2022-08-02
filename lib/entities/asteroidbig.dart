import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:starship_troopers_game/utilits/global_vars.dart';

import 'entity.dart';

class AsteroidBig extends Entity {
  AsteroidBig() : super("asteroidbig") {
    x = rng.nextInt(300).toDouble();
    y = rng.nextInt(300).toDouble();
    //x = GlobalVars.screenWidth + ;
    //y = GlobalVars.screenHeight + rng.nextInt(50);
  }

  var rng = Random();
  double _angleAs = 0; // Угол
  double _degreeAs = 0; // Градусы
  double _speedAs = 3.5;

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
    x += sin(_degreeAs) * _speedAs;
    //y -= cos(_degreeAs) * _speedAs;
    if (x > GlobalVars.screenWidth) {
      x = GlobalVars.screenWidth - GlobalVars.screenWidth;
    }
    //if (y > GlobalVars.screenHeight) {
    //  y = GlobalVars.screenHeight - GlobalVars.screenWidth;
    //}
  }
}
