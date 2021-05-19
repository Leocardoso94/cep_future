import 'package:via_cep_flutter/via_cep_flutter.dart';

Future<void> main() async {
  final result = await readAddressByCep('05653-070');

  print(result.city);
  print(result.cep);
  print(result.neighborhood);
  print(result.state);
  print(result.street);

  print(result.toJson());
}
