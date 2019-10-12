import 'package:flutter/cupertino.dart';

class Cep {
  const Cep({
    @required this.cep,
    @required this.state,
    @required this.city,
    @required this.street,
    @required this.neighborhood,
  });

  final String cep;
  final String state;
  final String city;
  final String street;
  final String neighborhood;
}
