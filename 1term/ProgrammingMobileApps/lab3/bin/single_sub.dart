import 'dart:async';

class OnlineShooterGame {
  String name;
  int players;

  OnlineShooterGame(this.name, this.players);

  Stream<int> playerScores() async* {
    for (int i = 1; i <= 5; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i * 10;
    }
  }
}

void main() async {
  OnlineShooterGame game = OnlineShooterGame('Call of Duty', 100);

  Stream<int> scoreStream = game.playerScores();
  await for (int score in scoreStream) {
    print('Single-subscription stream: Player scored $score points');
  }
}
