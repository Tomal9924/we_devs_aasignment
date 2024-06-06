class Categories {
  Categories({
    required this.id,
    required this.name,
    required this.slug,
  });
  late final int id;
  late final String name;
  late final String slug;

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}
