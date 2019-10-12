<h1 align="center">cep_future 💌</h1>

Uma library para Dart que que efetua a busca de CEPs em diversos serviços.
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
    var result = await cepFuture('05653-070');

    print(result.city);
    print(result.cep);
    print(result.neighborhood);
    print(result.state);
    print(result.street);
}
```
