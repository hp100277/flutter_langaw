import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:langaw/langaw-game.dart';

class SoundButton {
  final LangawGame game;
  Rect rect;
  Sprite enabledSprite;
  Sprite disabledSprite;
  bool isEnabled = false;

  SoundButton(this.game) {
    resize();
    enabledSprite = Sprite("ui/icon-sound-enabled.png");
    disabledSprite = Sprite("ui/icon-sound-disabled.png");
  }

  void render(Canvas canvas) {
    if (isEnabled)
      enabledSprite.renderRect(canvas, rect);
    else
      disabledSprite.renderRect(canvas, rect);
  }

  void resize() {
    rect = Rect.fromLTWH(
        game.tileSize * 1.5, game.tileSize * .25, game.tileSize, game.tileSize);
  }

  void onTapDown() {
    isEnabled = !isEnabled;
  }
}
