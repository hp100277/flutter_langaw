import 'dart:ui';
import 'package:flutter/painting.dart';
import 'package:langaw/langaw-game.dart';

class ScoreDisplay {
  final LangawGame game;
  TextPainter painter;
  TextStyle textStyle;
  Offset position;

  ScoreDisplay(this.game) {
    painter = TextPainter(
        textAlign: TextAlign.center, textDirection: TextDirection.ltr);
    position = Offset.zero;
  }

  void render(Canvas canvas) {
    painter.paint(canvas, position);
  }

  void update(double t) {
    if ((painter.text?.text ?? "") != game.score.toString()) {
      resize();
    }
  }

  void resize() {
    painter.text = TextSpan(
        text: game.score.toString(),
        style: TextStyle(
            color: Color(0xffffffff),
            fontSize: game.tileSize * 2,
            shadows: <Shadow>[
              Shadow(
                  blurRadius: game.tileSize * .25,
                  color: Color(0xff000000),
                  offset: Offset(3, 3))
            ]));
    painter.layout();
    position = Offset(game.screenSize.width / 2 - painter.width / 2,
        game.screenSize.height * .25 - painter.height / 2);
  }
}
