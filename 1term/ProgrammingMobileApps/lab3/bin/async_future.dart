import 'dart:async';

abstract interface class Multiplayer {
  void connectPlayers();
}

abstract class ComputerGame {
  String name;
  int players;

  ComputerGame(this.name, this.players);

  void startGame();
  void endGame();
}

class RPGGame extends ComputerGame {
  String genre;

  RPGGame(String name, int players, this.genre) : super(name, players);

  @override
  void startGame() {
    print('$name has started.');
  }

  @override
  void endGame() {
    print('$name has ended.');
  }
}

class ShooterGame extends ComputerGame {
  String weaponType;

  ShooterGame(String name, int players, this.weaponType) : super(name, players);

  @override
  void startGame() {
    print('$name has started.');
  }

  @override
  void endGame() {
    print('$name has ended.');
  }
}

class OnlineShooterGame extends ShooterGame implements Multiplayer {
  OnlineShooterGame(String name, int players, String weaponType)
      : super(name, players, weaponType);

  @override
  void connectPlayers() {
    print('Players connected.');
  }

  Future<void> loadGameData() async {
    print('Loading game data...');

    await Future.delayed(Duration(seconds: 2));

    print('Game data loaded.');
  }
}

void main() async {
  OnlineShooterGame shooter = OnlineShooterGame('Call of Duty', 100, 'Kar-98');
  shooter.connectPlayers();

  await shooter.loadGameData();
}
