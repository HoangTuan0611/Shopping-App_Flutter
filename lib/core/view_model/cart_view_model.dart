import 'package:ecommerce_app/core/services/database/cart_database.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;

  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];

  List<CartProductModel> get cartProductModel => _cartProductModel;

  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;
  var dbHelper = CartDatabaseHelper.db;
  CartViewModel() {
    getAllProduct();
  }
  getAllProduct() async {
    _loading.value = true;

    _cartProductModel = await dbHelper.getAllProduct();

    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].quantity is int)
        print("Quantity la int");
      else if (_cartProductModel[i].quantity is String)
        print("Quantity la string");
    }
    _loading.value = false;
    getTotalPrice();

    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += double.parse(_cartProductModel[i].price) *
          _cartProductModel[i].quantity;
      print('totalPrice: ');
      print(_totalPrice);
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        return;
      }
    }
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totalPrice +=
        double.parse(cartProductModel.price) * cartProductModel.quantity;
    update();
  }

  increaseQuantity(int i) async {
    _cartProductModel[i].quantity++;
    _totalPrice += double.parse(_cartProductModel[i].price);
    await dbHelper.updateProduct(_cartProductModel[i]);
    update();
  }

  decreaseQuantity(int i) async {
    _cartProductModel[i].quantity--;
    _totalPrice -= double.parse(_cartProductModel[i].price);
    await dbHelper.updateProduct(_cartProductModel[i]);
    update();
  }
}
