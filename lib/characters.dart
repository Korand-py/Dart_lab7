import 'dart:math';
import 'character.dart';

class Warrior extends Character {
  final int armor;
  Warrior({required String name})
    : armor = 5,
      super(name: name, hp: 120);
  @override
  int attack() {
    return 15 + Random().nextInt(11);
  }
  @override
  void takeDamage(int damage) {
    int reduced = (damage - armor).clamp(0, damage);
    super.takeDamage(reduced);
  }
  @override
  String toString() {
    return '⚔ Воин $name (брони: $armor)';
  }
}

class Mage extends Character {
  int mana;
  final int maxMana;
  Mage({required String name})
    : mana = 60,
      maxMana = 60,
      super(name: name, hp: 70);
  
  @override
  int attack() {
    if (mana >= 20) {
      mana -= 20;
      return 25 + Random().nextInt(16);
    } else {
      return 5 + Random().nextInt(6);
    }
  }

  @override
  String toString() {
    return '� Маг $name (мана: $mana/$maxMana)';
  }
}

class Archer extends Character{
  final double critChance;
  Archer({required String name})
  : critChance = 0.3,
  super(name: name, hp: 90);

  @override
  int attack() {
    bool isCrit = Random().nextDouble() < critChance;
    int base = 10 + Random().nextInt(11);
    if (isCrit) {
      print(' � Критический удар!');
      return (base * 2.5).round();
    }
    return base;
  }
  @override
  String toString() {
    return '� Лучник $name (шанс крита: ${(critChance * 100).round()}%)'; 
  }
}