import 'package:via_cep_flutter/via_cep_flutter.dart';
import 'package:via_cep_flutter/error.dart';
import 'package:test/test.dart';

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

  test('validateInputLength', () {
    expect(validateInputLength('12345'), '12345');
    expect(validateInputLength('12345678'), '12345678');
  });

  test('validateInputLength error', () {
    try {
      validateInputLength('123456789');
    } catch (e) {
      if (e is ServiceError)
        expect(e.message, 'CEP deve conter exatamente 8 caracteres.');
    }
  });

  test('leftPadWithZeros', () {
    expect(leftPadWithZeros('05516'), '00005516');
    expect(leftPadWithZeros('12345678'), '12345678');
  });

  test('cepFuture success', () async {
    final cep = await readAddressByCep('05653-070');

    expect(cep.city, 'São Paulo');
    expect(cep.cep, '05653070');
    expect(cep.neighborhood, 'Jardim Leonor');
    expect(cep.state, 'SP');
    expect(cep.street, 'Praça Roberto Gomes Pedrosa');

    expect(cep.toJson(), {
      'cep': '05653070',
      'state': 'SP',
      'city': 'São Paulo',
      'street': 'Praça Roberto Gomes Pedrosa',
      'neighborhood': 'Jardim Leonor'
    });
  });

  test('cepFuture error', () async {
    try {
      await readAddressByCep('11111');
    } catch (e) {
      if (e is ServiceError)
        expect(e.message, 'Todos os serviços de CEP retornaram erro.');
    }
  });
}
