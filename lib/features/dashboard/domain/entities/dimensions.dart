class Dimensions {
  Dimensions({
    required this.length,
    required this.width,
    required this.height,
  });
  late final String length;
  late final String width;
  late final String height;

  Dimensions.fromJson(Map<String, dynamic> json) {
    length = json['length'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['length'] = length;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}
