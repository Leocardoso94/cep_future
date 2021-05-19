<h1 align="center">ViaCepFlutter</h1>

### Este repositório é um fork atualizado de [Leocardoso94](https://github.com/Leocardoso94/cep_future) com suporte para null safety

Uma biblioteca para Flutter que efetua a busca de CEPs em diversos serviços.
Fortemente inspirado no pacote [CEP Promise](https://github.com/filipedeschamps/cep-promise)

## Features

- Sempre atualizado em tempo-real por se conectar diretamente aos serviços dos Correios e ViaCEP.

- Possui alta disponibilidade por usar vários serviços como fallback.
- Sempre retorna a resposta mais rápida por fazer as consultas de forma concorrente.
- Sem limites de uso (rate limits) conhecidos.

## Uso

Um simples exemplo de uso:

```dart
import 'package:via_cep_flutter/via_cep_flutter.dart';

main() async {
    final result = await readAddressByCep('05653-070');

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
