import 'package:flutter/cupertino.dart';

const DEFAULT_NUM = 10;

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

void syntax(param, {nulledParam: null}) {
  param ??= DEFAULT_NUM;
  print('[syntax] Got param = $param');
  print('[syntax] Got nulledParam = ${nulledParam ?? 'null'}');
}

// factories
abstract class Peripheral {
  final String _model;

  Peripheral({required String model}) : _model = model;

  factory Peripheral.factory({required String model, required String type}) {
    switch (type) {
      case 'Mice':
        return Mice(model: model);
      case 'Keyboard':
        return Keyboard(model: model);
      case 'type Keyboard':
        return TypeKeyboard(model: model);
    }
    throw Exception('unknown Peripheral type');
  }

  void use();

  get model => _model;
}

mixin Colorful {
  late Color _color;

  Color get color => _color;

  set color(Color color) => _color = color;
}

class Keyboard extends Peripheral {
  Keyboard({required String model}) : super(model: model) {
    print('Keyboard \'$model\' was created...');
  }

  @override
  void use() {
    print('Keyboard in use. Processing...');
  }
}

class TypeKeyboard extends Keyboard with Colorful {
  TypeKeyboard({required String model}) : super(model: model) {
    this._color = Color.fromRGBO(0, 0, 0, 1);
    print('Keyboard with model \'$model\' was created...');
  }

  @override
  void use() {
    print('...');
  }
}

class Mice extends Peripheral with Colorful {
  late String _revision;

  Mice({required String model}) : super(model: model) {
    print('Mice \'$model\' was created...');
  }

  @override
  void use() {
    print('Mice in use from revision: $_revision');
  }

  @override
  String toString() {
    return 'Mice {model: $_model, color: $_color, revision: $_revision}';
  }

  set revision(String revision) => _revision = revision;

}
