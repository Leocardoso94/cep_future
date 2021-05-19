class Cep {
  const Cep({
    this.cep = 'N/A',
    this.state = 'N/A',
    this.city = 'N/A',
    this.street = 'N/A',
    this.neighborhood = 'N/A',
  });

  final String cep;
  final String state;
  final String city;
  final String street;
  final String neighborhood;

  Map<String, dynamic> toJson() => {
        'cep': cep,
        'state': state,
        'city': city,
        'street': street,
        'neighborhood': neighborhood,
      };
}
