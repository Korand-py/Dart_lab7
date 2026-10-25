import 'character.dart';

void printSeparator() => print('-' * 40);

void fight(Character attacker, Character defender) {
  int damage = attacker.attack();
  defender.takeDamage(damage);
  print(
    ' ${attacker.name} наносит $damage урона ${defender.name}'
  );
}
void battle(Character player, Character enemy) {
    print('');
    printSeparator();
    print('⚔ БИТВА НАЧИНАЕТСЯ!');
    print('$player');
    print(' против');
    print('$enemy');
    printSeparator();

    int round = 1;

    while (player.isAlive && enemy.isAlive) {
      print('');
      print('Раунд $round:');
      fight(player, enemy);
      if (enemy.isAlive) fight(enemy, player);
      print('');
      player.describe();
      enemy.describe();
      round ++;

    }

    printSeparator();
    print('');
    if (player.isAlive) {
      print('� ${player.name} победил!');
    } else {
      print('� ${enemy.name} победил!');
    }
    printSeparator();
}
