import 'package:via_cep_flutter/enum.dart';
import 'package:via_cep_flutter/error.dart';
import 'package:via_cep_flutter/services/via_cep.dart';
import 'package:test/test.dart';

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
      if (e is ServiceError)
        expect(e.message, 'CEP não encontrado na base do ViaCEP.');
    }
  });

  test('fetchViaCepService wrong cep', () async {
    try {
      await fetchViaCepService('aa');
    } catch (e) {
      if (e is ServiceError) {
        expect(e.message, 'Erro ao se conectar com o serviço ViaCEP');
        expect(e.service, Service.ViaCEP);
      }
    }
  });
}
