import 'package:flutter/material.dart';

abstract class Entity {
  double x = 0;
  double y = 0;
  final String spriteName;
  bool visible = true;
  List sprites = [];
  int currentSprite = 0; // для показа текущего спрайта на данный момент
  int currentTick = 0; // для более красивой анимации смены спрайта

  Entity(this.spriteName) {
    for (var i = 0; i < 4; i++) {
      sprites.add(Image.asset("assets/$spriteName$i.png"));
    }
  }

  void _animate() {
    currentTick++;
    if (currentTick > 15) {
      currentSprite++;
      currentTick = 0;
    }
    if (currentSprite > 3) {
      currentSprite = 0;
    }
  }

  void update() {
    _animate();
    move();
  }

  void move();

  Widget build();
}
