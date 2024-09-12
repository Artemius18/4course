// 1 иерархия
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

// 2 интерфейс
abstract interface class Multiplayer {
  void connectPlayers();
}

class OnlineShooterGame extends ShooterGame implements Multiplayer {
  OnlineShooterGame(String name, int players, String weaponType)
      : super(name, players, weaponType);

  @override
  void connectPlayers() {
    print('Players connected.');
  }
}

// 3 абстрактный класс
abstract class GameCharacter {
  String name;
  int level;

  GameCharacter(this.name, this.level);

  void attack();
  void defend();
}

class Warrior extends GameCharacter {
  Warrior(String name, int level) : super(name, level);

  @override
  void attack() {
    print('$name attacks with sword.');
  }

  @override
  void defend() {
    print('$name defends with shield.');
  }
}

// 4 конструкторы, геттеры, сеттеры, статические поля и функция
class GameSettings {
  String resolution;
  int volume;
  static String defaultResolution = '1920x1080';

  GameSettings(this.resolution, this.volume);

  GameSettings.namedConstructor() : resolution = '1280x720', volume = 50;

  String get getResolution => resolution;
  set setResolution(String res) => resolution = res;

  static void resetSettings() {
    print('Settings reset to default.');
  }

  void updateSettings({String? newResolution, int newVolume = 100}) {
    resolution = newResolution ?? resolution;
    volume = newVolume;
  }

  void applySettings(Function callback) {
    callback();
  }
}

// 5 массив, коллекция и множество
void demonstrateCollections() {
  // Массив
  List<String> gameList = ['RPG', 'Shooter', 'Strategy'];
  gameList.forEach((game) => print(game));

  // Коллекция
  Map<String, int> playerScores = {'Artyom': 100, 'Danila': 200};
  playerScores.forEach((player, score) => print('$player: $score'));

  // Множество
  Set<String> uniqueGames = {'RPG', 'Shooter', 'Strategy', 'RPG'};
  uniqueGames.forEach((game) => print(game));
}

// 6 continue и break
void demonstrateLoopControl() {
  for (int i = 0; i < 5; i++) {
    if (i == 2) continue;
    if (i == 4) break;
    print(i);
  }
}


void main() {
  RPGGame rpg = RPGGame('Some rpg', 1, 'Genre');
  rpg.startGame();
  rpg.endGame();

  OnlineShooterGame shooter = OnlineShooterGame('Call of duty', 100, 'Kar-98');
  shooter.connectPlayers();

  GameSettings settings = GameSettings('2560x1440', 80);
  print(settings.getResolution);
  GameSettings.defaultResolution = '480x320';
  GameSettings.resetSettings();
  settings.updateSettings(newVolume: 70);
  print(settings.volume);
  settings.applySettings(() => print('Settings applied.'));
  GameSettings settings2 = GameSettings.namedConstructor();
  print(settings2.resolution);

  demonstrateCollections();
  demonstrateLoopControl();

  try{
    List<String> gameList = ['RPG', 'Shooter', 'Strategy'];
    print(gameList[5]);
  }
  catch(e){
    print("Возникло исключение $e");
  }

  int age = 123;
  if(0<age || age>100) {
    throw Exception("Age should be less than 99 ");
  }
}
