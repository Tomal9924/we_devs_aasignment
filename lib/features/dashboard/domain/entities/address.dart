class Address {
  Address({
    required this.street_1,
    required this.street_2,
    required this.city,
    required this.zip,
    required this.country,
    required this.state,
  });
  late final String street_1;
  late final String street_2;
  late final String city;
  late final String zip;
  late final String country;
  late final String state;

  Address.fromJson(Map<String, dynamic> json) {
    street_1 = json['street_1'];
    street_2 = json['street_2'];
    city = json['city'];
    zip = json['zip'];
    country = json['country'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['street_1'] = street_1;
    data['street_2'] = street_2;
    data['city'] = city;
    data['zip'] = zip;
    data['country'] = country;
    data['state'] = state;
    return data;
  }
}
