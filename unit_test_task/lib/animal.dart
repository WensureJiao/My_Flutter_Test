enum MovementType { run, fly, swim, climb, walk }

abstract class MovementStrategy {
  String move();
}

class RunStrategy implements MovementStrategy {
  @override
  String move() => "奔跑";
}

class FlyStrategy implements MovementStrategy {
  @override
  String move() => "飞翔";
}

class SwimStrategy implements MovementStrategy {
  @override
  String move() => "游泳";
}

class ClimbStrategy implements MovementStrategy {
  @override
  String move() => "爬树";
}

class WalkStrategy implements MovementStrategy {
  @override
  String move() => "走路";
}

// Movement mixin 改为返回字符串
mixin Movement {
  late final MovementType movement;
  late final MovementStrategy _movementStrategy;

  MovementStrategy createMovementStrategy() {
    switch (movement) {
      case MovementType.run:
        return RunStrategy();
      case MovementType.fly:
        return FlyStrategy();
      case MovementType.swim:
        return SwimStrategy();
      case MovementType.climb:
        return ClimbStrategy();
      case MovementType.walk:
        return WalkStrategy();
    }
  }

  String move() {
    return _movementStrategy.move();
  }
}

// Sayable mixin 返回字符串
mixin Sayable {
  String say() => "叫声";
}

mixin Housekeeping {
  String housekeeping() => "看家";
}

//大类 animal
abstract class Animal with Movement {
  String eat();
}

//动物目：哺乳动物、鸟类飞行动物
abstract class Mammal extends Animal {
  Mammal() {
    movement = MovementType.run;
    _movementStrategy = createMovementStrategy();
  }
}

abstract class BirdKind extends Animal {
  BirdKind() {
    movement = MovementType.fly;
    _movementStrategy = createMovementStrategy();
  }
}

//自定义运动策略
class SheepRunStrategy implements MovementStrategy {
  @override
  String move() => "羊优雅地奔跑";
}

class DogRunStrategy implements MovementStrategy {
  @override
  String move() => "狗快速奔跑";
}

class BirdFlyStrategy implements MovementStrategy {
  @override
  String move() => "鸟优雅地飞翔";
}

//具体动物类
class Dog extends Mammal with Sayable, Housekeeping {
  @override
  MovementStrategy createMovementStrategy() {
    return DogRunStrategy();
  }

  @override
  String eat() => "吃骨头";

  @override
  String say() => "汪汪";

  @override
  String housekeeping() => "看家";
}

class Sheep extends Mammal with Sayable {
  @override
  MovementStrategy createMovementStrategy() {
    return SheepRunStrategy();
  }

  @override
  String eat() => "吃草";

  @override
  String say() => "咩咩";
}

class Bird extends BirdKind with Sayable {
  @override
  MovementStrategy createMovementStrategy() {
    return BirdFlyStrategy();
  }

  @override
  String eat() => "吃虫子";

  @override
  String say() => "叽叽喳喳";
}

class Monkey extends Animal with Movement {
  Monkey() {
    movement = MovementType.climb;
    _movementStrategy = createMovementStrategy();
  }

  @override
  String eat() => "吃香蕉";
}

class Fish extends Animal with Movement {
  Fish() {
    movement = MovementType.swim;
    _movementStrategy = createMovementStrategy();
  }

  @override
  String eat() => "吃水草";
}

//创建一个新的动物：天鹅，并在鸟的基础上添加飞翔、游泳、走路的移动方式。
class Swan extends BirdKind with Movement, Sayable {
  final List<MovementType> movementTypes = [
    MovementType.fly,
    MovementType.swim,
    MovementType.walk,
  ];
  @override
  String move() {
    return movementTypes
        .map((type) {
          switch (type) {
            case MovementType.fly:
              return "天鹅优雅地飞翔";
            case MovementType.swim:
              return "天鹅在水中游泳";
            case MovementType.walk:
              return "天鹅在陆地上走路";
            default:
              return "";
          }
        })
        .join(", ");
  }

  @override
  String eat() => "吃水草";

  @override
  MovementStrategy createMovementStrategy() {
    return FlyStrategy(); // 默认使用飞行策略
  }

  @override
  String say() => "天鹅叫声";
}

//测试天鹅
void main() {
  final swan = Swan();
  print(swan.move()); // 输出: 天鹅优雅地飞翔, 天鹅在水中游泳, 天鹅在陆地上走路
  print(swan.eat()); // 输出: 吃水草
}
