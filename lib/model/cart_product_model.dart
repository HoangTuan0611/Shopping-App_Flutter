class CartProductModel {
  dynamic quantity;
  String name, image, price, productId;

  CartProductModel(
      {this.name, this.image, this.price, this.quantity, this.productId});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    quantity = map['quantity'];
    productId = map['productId'];
    name = map['name'];
    image = map['image'];
    price = map['price'].toString();
  }

  toJson() {
    return {
      'quantity': quantity,
      'name': name,
      'image': image,
      'price': price,
      'productId': productId,
    };
  }
}
