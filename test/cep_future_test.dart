import 'package:cep_future/cep_future.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // test('adds one to input values', () {
  //   final calculator = Calculator();
  //   expect(calculator.addOne(2), 3);
  //   expect(calculator.addOne(-7), -6);
  //   expect(calculator.addOne(0), 1);
  //   expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  // });

  test('removeSpecialCharacters', () {
    expect(removeSpecialCharacters('055,16'), '05516');
    expect(removeSpecialCharacters('055,16,'), '05516');
    expect(removeSpecialCharacters('-055-16,'), '05516');
  });

  // test('validateInputLength', () {
  //   expect(validateInputLength('12345'), '12345');
  //   expect(
  //     validateInputLength('12345121212'),
  //     instamce(matcher),
  //   );
  // });

  test('leftPadWithZeros', () {
    expect(leftPadWithZeros('05516'), '00005516');
    expect(leftPadWithZeros('12345678'), '12345678');
  });
}
