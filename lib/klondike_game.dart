import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_game_flame/components/stock.dart';
import 'package:flutter_game_flame/components/waste.dart';

class KlondikeGame extends FlameGame {
  static const double cardWidth = 1000.0;
  static const double cardHeight = 1400.0;
  static const double cardGap = 175.0;
  static const double cardRadius = 100.0;
  static final Vector2 cardSize = Vector2(cardWidth, cardHeight);

  @override
  Future<void> onLoad() async {
    await Flame.images.load('klondike-sprites.png');
    final stock = Stock()
      ..size = cardSize
      ..position = Vector2(cardGap, cardGap);
    final waste = Waste()
      ..size = cardSize
      ..position = Vector2(cardWidth + 2 * cardGap, cardGap);
  }

  Sprite klondikeSprite(double x, double y, double width, double height) {
    return Sprite(
      Flame.images.fromCache('klondike-sprites.png'),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height),
    );
  }
}
