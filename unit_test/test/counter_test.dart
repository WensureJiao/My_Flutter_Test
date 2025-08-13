// Import the test package and Counter class
import 'package:unit_test/counter.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('test start,increment,decrement', () {
    test('value should stqrt at 0', () {
      expect(Counter().value, 0); // 检查初始值是否为 0
    });
    test('value should be incremented', () {
      final counter = Counter();
      counter.increment(); // 调用 increment 方法
      expect(counter.value, 1); // 检查值是否增加到 1
    });
    test('value should be decremented', () {
      final counter = Counter();
      counter.decrement(); // 调用 decrement 方法
      expect(counter.value, -1); // 检查值是否减少到 -1
    });
  });
}
