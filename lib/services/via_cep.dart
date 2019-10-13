import 'dart:async';
import 'dart:convert';

import 'package:cep_future/enum.dart';
import 'package:cep_future/error.dart';
import 'package:cep_future/models/cep.dart';
import 'package:http/http.dart' as http;

Map<String, dynamic> analyzeAndParseResponse(http.Response response) {
  if (response.statusCode == 200) return json.decode(response.body);

  throw SimpleError('Erro ao se conectar com o serviço ViaCEP');
}

Map<String, dynamic> checkForViaCepError(Map<String, dynamic> responseObject) {
  if (responseObject['erro'] == true) {
    throw SimpleError('CEP não encontrado na base do ViaCEP.');
  }

  return responseObject;
}

Cep extractCepValuesFromResponse(Map<String, dynamic> responseObject) {
  return Cep(
    cep: responseObject['cep'].replaceFirst('-', ''),
    city: responseObject['localidade'],
    neighborhood: responseObject['bairro'],
    state: responseObject['uf'],
    street: responseObject['logradouro'],
  );
}

void throwApplicationError(Object e) {
  final String message = e is SimpleError
      ? e.message
      : 'Erro ao se conectar com o serviço ViaCEP.';

  throw ServiceError(
    service: Service.ViaCEP,
    message: message,
  );
}

Future<Cep> fetchViaCepService(String cepWithLeftPad) async {
  final String url = 'https://viacep.com.br/ws/$cepWithLeftPad/json/';

  return http
      .get(
        url,
        headers: {
          'content-type': 'application/json;charset=utf-8',
        },
      )
      .then(analyzeAndParseResponse)
      .then(checkForViaCepError)
      .then(extractCepValuesFromResponse)
      .catchError(throwApplicationError);
}
