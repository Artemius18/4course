import 'dart:convert';

abstract class ComputerGame {
  String name;
  int players;

  ComputerGame(this.name, this.players);

  void startGame();
  void endGame();

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'players': players,
    };
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

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json['genre'] = genre;
    return json;
  }
}

void main() {
  RPGGame rpg = RPGGame('Some RPG', 1, 'Fantasy');

  String jsonStr = jsonEncode(rpg.toJson());
  print('Serialized to JSON: $jsonStr');
}
