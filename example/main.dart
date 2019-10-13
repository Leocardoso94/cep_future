import 'package:cep_future/cep_future.dart';

Future<void> main() async {
  final result = await cepFuture('05653-070');

  print(result.city);
  print(result.cep);
  print(result.neighborhood);
  print(result.state);
  print(result.street);

  print(result.toJson());
}
