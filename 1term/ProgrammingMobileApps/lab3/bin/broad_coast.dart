import 'dart:async';

class OnlineShooterGame {
  String name;
  int players;

  OnlineShooterGame(this.name, this.players);

  Stream<int> playerHealthBroadcast() {
    StreamController<int> controller = StreamController<int>.broadcast();

    Timer.periodic(Duration(seconds: 1), (timer) {
      int health = 100 - timer.tick * 10;
      controller.add(health);

      if (health <= 0) {
        controller.close();
        timer.cancel();
      }
    });

    return controller.stream;
  }
}

void main() {
  OnlineShooterGame game = OnlineShooterGame('Call of Duty', 100);

  Stream<int> healthStream = game.playerHealthBroadcast();
  Stream<int> healthStream2 = game.playerHealthBroadcast();

  healthStream.listen((health) {
    print('Broadcast stream - Subscriber 1: Player health is $health');
  });

  healthStream2.listen((health) {
    print('Broadcast stream - Subscriber 2: Player health is $health');
  });
}
