import 'package:flutter_test/flutter_test.dart';

import 'package:unit_test_task/animal.dart';

void main() {
  group('Animal Tests', () {
    test('Dog test', () {
      final dog = Dog();
      expect(dog.say(), "汪汪");
      expect(dog.move(), "狗快速奔跑");
      expect(dog.eat(), "吃骨头");
      expect(dog.housekeeping(), "看家");
    });
    test('Sheep test', () {
      final sheep = Sheep();
      expect(sheep.say(), "咩咩");
      expect(sheep.move(), "羊优雅地奔跑");
      expect(sheep.eat(), "吃草");
    });
    test('Bird test', () {
      final bird = Bird();
      expect(bird.move(), "鸟优雅地飞翔");
      expect(bird.eat(), "吃虫子");
    });
    test('Monkey test', () {
      final monkey = Monkey();
      expect(monkey.move(), "爬树");
      expect(monkey.eat(), "吃香蕉");
    });
    test('Fish test', () {
      final fish = Fish();
      expect(fish.move(), "游泳");
      expect(fish.eat(), "吃水草");
    });
    test('Swan test', () {
      final swan = Swan();
      expect(swan.move(), "天鹅优雅地飞翔, 天鹅在水中游泳, 天鹅在陆地上走路");
      expect(swan.eat(), "吃水草");
      expect(swan.say(), "天鹅叫声");
    });
  });
}
