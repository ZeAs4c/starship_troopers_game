import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:starship_troopers_game/entities/entity.dart';

class Explosion extends Entity {
  Explosion({required double asteroidX, required double asteroidY})
      : super("explosion") {
    x = asteroidX;
    y = asteroidY;
  }
  double _angleAs = 0;
  @override
  Widget build() {
    return Positioned(
      top: y,
      left: x,
      child: Transform.rotate(
        angle: _angleAs,
        child: sprites[currentSprite],
      ),
    );
  }

  @override
  void move() {
    // TODO: implement move
  }
}
