import 'dart:ui';
import 'package:flutter/painting.dart';
import 'package:langaw/langaw-game.dart';

class HighscoreDisplay {
  final LangawGame game;
  TextPainter painter;
  TextStyle textStyle;
  Offset position;

  HighscoreDisplay(this.game) {
    painter = TextPainter(
        textAlign: TextAlign.center, textDirection: TextDirection.ltr);
    position = Offset.zero;

    updateHighscore();
  }

  void render(Canvas canvas) {
    painter.paint(canvas, position);
  }

  void updateHighscore() {
    resize();
  }

  void resize() {
    int highscore = game.storage.getInt('highscore') ?? 0;
    Shadow shadow = Shadow(
        blurRadius: game.tileSize * .0625,
        color: Color(0xff000000),
        offset: Offset.zero);

    painter.text = TextSpan(
        text: '最高记录：' + highscore.toString(),
        style: TextStyle(color: Color(0xffffffff), fontSize: 30, shadows: [
          shadow,
          shadow,
          shadow,
          shadow,
          shadow,
          shadow,
          shadow,
          shadow
        ]));
    if (painter.text == null) return;
    painter.layout();
    position = Offset(
        game.screenSize.width - game.tileSize * .25 - painter.width,
        game.tileSize * .25);
  }
}
