import 'package:cep_future/enum.dart';
import 'package:cep_future/services/correios.dart';
import 'package:cep_future/services/via_cep.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fetchViaCepService success', () async {
    final cep = await fetchViaCepService('05653070');

    expect(cep.city, 'São Paulo');
    expect(cep.cep, '05653070');
    expect(cep.neighborhood, 'Jardim Leonor');
    expect(cep.state, 'SP');
    expect(cep.street, 'Praça Roberto Gomes Pedrosa');
  });

  test('fetchViaCepService invalid cep', () async {
    try {
      await fetchViaCepService('11111111');
    } catch (e) {
      expect(e.message, 'CEP não encontrado na base do ViaCEP.');
    }
  });

  test('fetchViaCepService wrong cep', () async {
    try {
      await fetchViaCepService('aa');
    } catch (e) {
      expect(e.message, 'Erro ao se conectar com o serviço ViaCEP');
      expect(e.service, Service.ViaCEP);
    }
  });

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
