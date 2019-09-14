import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:langaw/langaw-game.dart';
import "package:langaw/bgm.dart";

class MusicButton {
  final LangawGame game;
  Rect rect;
  Sprite enabledSprite;
  Sprite disabledSprite;
  bool isEnabled = false;

  MusicButton(this.game) {
    resize();
    enabledSprite = Sprite("ui/icon-music-enabled.png");
    disabledSprite = Sprite("ui/icon-music-disabled.png");
  }

  void render(Canvas canvas) {
    if (isEnabled)
      enabledSprite.renderRect(canvas, rect);
    else
      disabledSprite.renderRect(canvas, rect);
  }

  void resize() {
    rect = Rect.fromLTWH(
        game.tileSize * .25, game.tileSize * .25, game.tileSize, game.tileSize);
  }

  void onTapDown() {
    if (isEnabled) {
      isEnabled = false;
      BGM.pause();
    } else {
      isEnabled = true;
      BGM.resume();
    }
  }
}
