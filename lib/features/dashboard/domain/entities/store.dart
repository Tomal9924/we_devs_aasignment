import 'address.dart';

class Store {
  Store({
    required this.id,
    required this.name,
    required this.url,
    required this.avatar,
    required this.address,
  });
  late final int id;
  late final String name;
  late final String url;
  late final String avatar;
  late final Address address;

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    avatar = json['avatar'];
    address = Address.fromJson(json['address']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    data['avatar'] = avatar;
    data['address'] = address.toJson();
    return data;
  }
}
