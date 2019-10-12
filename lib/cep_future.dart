library cep_future;

import 'package:cep_future/error.dart';
import 'package:cep_future/models/cep.dart';
import 'package:cep_future/services/via_cep.dart';

const CEP_SIZE = 8;

Future<Cep> fetchCepFromServices(String cepWithLeftPad) => Future.any([
      fetchViaCepService(cepWithLeftPad),
    ]);

void throwApplicationError(Object e) {
  throw e;
}

void handleServicesError(Object aggregatedErrors) {
  if (aggregatedErrors.runtimeType == SimpleError) {
    throw SimpleError('Todos os serviços de CEP retornaram erro.');
  }

  throw aggregatedErrors;
}

String removeSpecialCharacters(String cepRawValue) =>
    cepRawValue.replaceAll(RegExp(r'[^0-9]'), '');

String validateInputLength(String input) {
  if (input.length <= CEP_SIZE) return input;

  throw ArgumentError('CEP deve conter exatamente $CEP_SIZE caracteres.');
}

String leftPadWithZeros(String cep) {
  return ''.padLeft(CEP_SIZE - cep.length).replaceAll(' ', '0') + cep;
}

Future<Cep> cepFuture(String cepRawValue) async =>
    await Future.value(cepRawValue)
        .then(removeSpecialCharacters)
        .then(validateInputLength)
        .then(leftPadWithZeros)
        .then(fetchCepFromServices)
        .catchError(handleServicesError)
        .catchError(throwApplicationError);
