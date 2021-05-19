library cep_future;

import 'dart:async';

import 'package:via_cep_flutter/error.dart';
import 'package:via_cep_flutter/models/cep.dart';
import 'package:via_cep_flutter/services/correios.dart';
import 'package:via_cep_flutter/services/via_cep.dart';

const CEP_SIZE = 8;

Future<Cep> fetchCepFromServices(String cepWithLeftPad) {
  final completer = Completer<Cep>();

  final errors = <Error>[];

  final onValue = (Cep value) {
    if (!completer.isCompleted) completer.complete(value);
  };

  final futures = [
    fetchCorreiosService(cepWithLeftPad),
    fetchViaCepService(cepWithLeftPad)
  ];

  final onError = (error, StackTrace stack) {
    errors.add(error);

    if (!completer.isCompleted && futures.length == errors.length) {
      completer.completeError(error, stack);
    }
  };

  for (var future in futures) {
    future.then(onValue, onError: onError);
  }

  return completer.future;
}

void throwApplicationError(Object e) {
  throw e;
}

void handleServicesError(Object aggregatedErrors) {
  print(aggregatedErrors.runtimeType);
  if (aggregatedErrors.runtimeType == ServiceError) {
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

/// ## Receive a CEP and return the address corresponding by that CEP
Future<Cep> readAddressByCep(String cepRawValue) async {
  var cep = const Cep();

  try {
    var cepStringTreated = removeSpecialCharacters(cepRawValue);

    cepStringTreated = validateInputLength(cepStringTreated);

    cepStringTreated = leftPadWithZeros(cepStringTreated);

    cep = await fetchCepFromServices(cepStringTreated);
  } catch (e) {
    handleServicesError(e);
    throwApplicationError(e);
  }

  return cep;
}
