import 'package:flutter/cupertino.dart';

const DEFAULT_NUMERIC_VALUE = 10;

class BasicClass<T extends num> {
  T _a;
  T _b;

  BasicClass({required T a, required T b})
      : _a = a,
        _b = b;

  get sum => _a + _b;

  set a(a) => _a = a;

  set b(b) => _b = b;

  @override
  String toString() {
    return 'BasicClass {a: $_a, b: $_b}';
  }
}

// closure
Function multiplier({required by}) {
  return (num) => num * by;
}

void syntaxSugar(param, {nulledParam: null}) {
  param ??= DEFAULT_NUMERIC_VALUE;
  print('[syntaxSugar] Got param = $param');
  print('[syntaxSugar] Got nulledParam = ${nulledParam ?? 'null'}');
}

// factories
abstract class Animal {
  final String _name;

  Animal({required String name}) : _name = name;

  factory Animal.factory({required String name, required String type}) {
    switch (type) {
      case 'dog':
        return Dog(name: name);
      case 'cat':
        return Cat(name: name);
      case 'black cat':
        return BlackCat(name: name);
    }
    throw Exception('unknown animal type');
  }

  void play();

  get name => _name;
}

mixin Colorful {
  late Color _color;

  Color get color => _color;

  set color(Color color) => _color = color;
}

class Cat extends Animal {
  Cat({required String name}) : super(name: name) {
    print('Cat \'$name\' was created...');
  }

  @override
  void play() {
    print('I\'m a cat! Nyaaaaa..');
  }
}

class BlackCat extends Cat with Colorful {
  BlackCat({required String name}) : super(name: name) {
    this._color = Color.fromRGBO(0, 0, 0, 1.0);
    print('Black cat with name \'$name\' was created...');
  }

  @override
  void play() {
    print('...');
  }
}

class Dog extends Animal with Colorful {
  late String _favoriteBone;

  Dog({required String name}) : super(name: name) {
    print('Dog \'$name\' was created...');
  }

  @override
  void play() {
    print('I\'m a dog! Playing with my $_favoriteBone');
  }

  @override
  String toString() {
    return 'Dog {name: $_name, color: $_color, favoriteBone: $_favoriteBone}';
  }

  set favoriteBone(String favoriteBone) => _favoriteBone = favoriteBone;

}
