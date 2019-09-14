import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:langaw/langaw-game.dart';

class Backyard {
  final LangawGame game;
  Sprite bgSprite;
  Rect bgRect;

  Backyard(this.game) {
    resize();
    bgSprite = Sprite('bg/backyard.png');
  }

  void render(Canvas canvas) {
    bgSprite.renderRect(canvas, bgRect);
  }

  void update(double t) {}

  void resize() {
    bgRect = Rect.fromLTWH(0, game.screenSize.height - game.tileSize * 23,
        game.tileSize * 9, game.tileSize * 23);
  }
}
