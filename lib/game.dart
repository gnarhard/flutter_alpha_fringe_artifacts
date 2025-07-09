import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame with SingleGameInstance {
  @override
  Future<void> onLoad() async {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen();

    camera = CameraComponent.withFixedResolution(
      width: size.x,
      height: size.y,
      world: world,
      viewfinder: Viewfinder()..anchor = Anchor.topLeft,
    );

    add(camera);

    world.add(
      RectangleComponent(
        size: size,
        paint: Paint()..color = Colors.white.withAlpha(200),
        anchor: Anchor.center,
        position: size / 2,
        children: [
          SpriteComponent(
            sprite: await loadSprite('void1.png'),
            position: size / 2,
            paint: Paint()
              ..isAntiAlias = true
              ..filterQuality = FilterQuality.none
              ..blendMode = BlendMode.overlay,
          ),
        ],
      ),
    );
  }
}
