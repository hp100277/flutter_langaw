import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:langaw/langaw-game.dart';
import 'package:langaw/view.dart';
import 'package:langaw/bgm.dart';

class StartButton {
  final LangawGame game;
  Rect rect;
  Sprite sprite;

  StartButton(this.game) {
    resize();
    sprite = Sprite('ui/start-button.png');
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
  }

  void update(double t) {}

  void onTapDown() {
    game.score = 0;
    game.flySpawner.start();
    game.activeView = View.playing;
    BGM.play(BGMType.playing);
  }

  void resize() {
    rect = Rect.fromLTWH(
        game.tileSize * 1.5,
        game.screenSize.height * 0.75 - game.tileSize * 1.5,
        game.tileSize * 6,
        game.tileSize * 3);
  }
}
