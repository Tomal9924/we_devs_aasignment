class MetaData {
  MetaData({
    required this.id,
    required this.key,
    required this.value,
  });
  late final int id;
  late final String key;
  late final String value;

  MetaData.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    key = json['key'] ?? "";
    value = json['value'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}
