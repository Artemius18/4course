import 'dart:collection';

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
}

class RPGGameIterator implements Iterator<RPGGame> {
  final List<RPGGame> _games;
  int _currentIndex = -1;

  RPGGameIterator(this._games);

  @override
  bool moveNext() {
    if (_currentIndex + 1 < _games.length) {
      _currentIndex++;
      return true;
    }
    return false;
  }

  @override
  RPGGame get current => _games[_currentIndex];
}

class RPGGameCollection extends IterableBase<RPGGame> {
  final List<RPGGame> _games = [];

  void addGame(RPGGame game) {
    _games.add(game);
  }

  @override
  Iterator<RPGGame> get iterator => RPGGameIterator(_games);
}

void main() {
  RPGGame rpg1 = RPGGame('RPG 1', 1, 'Fantasy');
  RPGGame rpg2 = RPGGame('RPG 2', 2, 'Sci-Fi');
  RPGGame rpg3 = RPGGame('RPG 3', 3, 'Smth');


  RPGGameCollection rpgCollection = RPGGameCollection();
  rpgCollection.addGame(rpg1);
  rpgCollection.addGame(rpg2);
  rpgCollection.addGame(rpg3);


  for (var rpg in rpgCollection) {
    print('Game: ${rpg.name}, Genre: ${rpg.genre}');
  }
}
