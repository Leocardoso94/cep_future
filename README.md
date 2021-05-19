<h1 align="center">ViaCepFlutter</h1>

[![Pub](https://img.shields.io/pub/v/cep_future.svg)](https://pub.dartlang.org/packages/cep_future) [![Build Status](https://travis-ci.com/Leocardoso94/cep_future.svg?branch=master)](https://travis-ci.com/Leocardoso94/cep_future) [![Coverage Status](https://coveralls.io/repos/github/Leocardoso94/cep_future/badge.svg?branch=master)](https://coveralls.io/github/Leocardoso94/cep_future?branch=master)

Uma library para Dart que efetua a busca de CEPs em diversos serviços.
Fortemente inspirado no pacote [CEP Promise](https://github.com/filipedeschamps/cep-promise)

## Features

- Sempre atualizado em tempo-real por se conectar diretamente aos serviços dos Correios e ViaCEP.

- Possui alta disponibilidade por usar vários serviços como fallback.
- Sempre retorna a resposta mais rápida por fazer as consultas de forma concorrente.
- Sem limites de uso (rate limits) conhecidos.

## Uso

Um simples exemplo de uso:

```dart
import 'package:cep_future/cep_future.dart';

main() async {
    final result = await cepFuture('05653-070');

    print(result.city);
    print(result.cep);
    print(result.neighborhood);
    print(result.state);
    print(result.street);

    // or

    print(result.toJson());
    // {
    //     'cep': '05653070',
    //     'state': 'SP',
    //     'city': 'São Paulo',
    //     'street': 'Praça Roberto Gomes Pedrosa',
    //     'neighborhood': 'Jardim Leonor'
    // }
}
```
