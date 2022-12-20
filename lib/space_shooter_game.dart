import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

class SpaceShooterGame extends FlameGame with PanDetector {
  late Player player;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    player = Player();
    // final playerSprite = await loadSprite('player-sprite.png');
    // player = Player()
    //   ..sprite = playerSprite
    //   ..x = size.x / 2
    //   ..y = size.y / 2
    //   //..position = size / 2
    //   ..width = 50
    //   ..height = 100
    //   ..anchor = Anchor.center;
    add(player);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.move(info.delta.game);
  }
}

class Player extends SpriteComponent with HasGameRef<SpaceShooterGame> {
  //static final _paint = Paint()..color = Colors.white;

  // @override
  // void render(Canvas canvas) {
  //   super.render(canvas);
  //   canvas.drawRect(size.toRect(), _paint);
  // }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('player-sprite.png');
    position = gameRef.size / 2;
    width = 100;
    height = 150;
    anchor = Anchor.bottomCenter;
  }

  void move(Vector2 delta) {
    position.add(delta);
  }
}
