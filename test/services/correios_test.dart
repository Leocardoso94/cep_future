import 'package:cep_future/enum.dart';
import 'package:cep_future/services/correios.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fetchCorreiosService success', () async {
    final cep = await fetchCorreiosService('05653070');

    expect(cep.city, 'São Paulo');
    expect(cep.cep, '05653070');
    expect(cep.neighborhood, 'Jardim Leonor');
    expect(cep.state, 'SP');
    expect(cep.street, 'Praça Roberto Gomes Pedrosa');
  });

  test('fetchCorreiosService error', () async {
    try {
      await fetchCorreiosService('11111111');
    } catch (e) {
      expect(e.message, 'CEP INVÁLIDO');
      expect(e.service, Service.Correios);
    }
  });
}
