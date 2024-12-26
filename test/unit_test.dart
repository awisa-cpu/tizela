import 'package:flutter_test/flutter_test.dart';

void main() {
  test("is Even", () {
    final result = isEven(10);
    expect(result, true);

    //
    final result2 = isEven(5);
    expect(result2, true);
  });
}

bool isEven(int number) {
  if (number % 2 == 0) {
    return true;
  } else {
    return false;
  }
}
