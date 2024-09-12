mixin Stats {
  void showStats() {
    print('Some stats here');
  }
}

mixin Achievements {
  void unlockAchievement(String achievement) {
    print('Achievement unlocked');
  }
}

mixin StartTimer {
  void startTimer() {
    print('Timer has started');
  }
}

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

class RPGGame extends ComputerGame with Stats, Achievements {
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

class OnlineShooterGame extends ShooterGame with Stats, Achievements, StartTimer implements Multiplayer {
  OnlineShooterGame(String name, int players, String weaponType)
      : super(name, players, weaponType);

  @override
  void connectPlayers() {
    print('Players connected.');
  }
}


void main() {
  RPGGame rpg = RPGGame('Some RPG', 1, 'Genre');
  rpg.startGame();
  rpg.showStats();
  rpg.unlockAchievement('First Quest Completed');
  rpg.endGame();
  print('\n');

  OnlineShooterGame shooter = OnlineShooterGame('Call of Duty', 100, 'Kar-98');
  shooter.connectPlayers();
  shooter.showStats();
  shooter.startTimer();
  shooter.unlockAchievement('First Kill');

}