import 'dart:core';

abstract interface class Multiplayer {
  void connectPlayers();
}

abstract class ComputerGame implements Comparable<ComputerGame> {
  String name;
  int players;

  ComputerGame(this.name, this.players);

  void startGame();
  void endGame();

  @override
  int compareTo(ComputerGame smth) {
    return players.compareTo(smth.players);
  }
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
}

void main() {
  RPGGame rpg = RPGGame('Some RPG', 1000, 'Genre');
  rpg.startGame();
  rpg.endGame();

  OnlineShooterGame shooter = OnlineShooterGame('Call of Duty', 100, 'Kar-98');
  shooter.connectPlayers();
  print(rpg.compareTo(shooter));
}




// -1 -> a < b
// 0 -> a = b
// 1 -> a > b
