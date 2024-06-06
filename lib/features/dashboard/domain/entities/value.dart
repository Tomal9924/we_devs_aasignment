class Value {
  Value({
    required this.enableWholesale,
    required this.price,
    required this.quantity,
  });
  late final String enableWholesale;
  late final String price;
  late final int quantity;

  Value.fromJson(Map<String, dynamic> json) {
    enableWholesale = json['enable_wholesale'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['enable_wholesale'] = enableWholesale;
    data['price'] = price;
    data['quantity'] = quantity;
    return data;
  }
}
