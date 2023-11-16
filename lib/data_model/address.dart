class Address {
  String? country;
  String? prefecture;
  String? municipality;
  String? street;
  String? apartment;

  Address({
    this.country,
    this.prefecture,
    this.municipality,
    this.street,
    this.apartment,
  });

  Address.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    prefecture = json['prefecture'];
    municipality = json['municipality'];
    street = json['street'];
    apartment = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['prefecture'] = prefecture;
    data['municipality'] = municipality;
    data['street'] = street;
    data['apartment'] = apartment;
    return data;
  }
}
