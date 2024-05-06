// Cart Repository
// カートリポジトリ
import 'dart:convert';

import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  CartRepo({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;
  List<String> cart = [];
  List<String> cartHistory = [];

  // Add data to cart list
  // カートリストにデータを追加
  void addToCartList(List<CartModel> cartList) {
    var time = DateTime.now().toString();
    cart = [];
    cartList.forEach((element) {
      element.time = time;
      return cart.add(
        jsonEncode(element),
      );
    });
    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
  }

  // Get cart list
  // カートリストを取得
  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
    }
    List<CartModel> cartList = [];
    carts.forEach(
      (element) => cartList.add(
        CartModel.fromJson(
          jsonDecode(element),
        ),
      ),
    );
    return cartList;
  }

  // Get cart history list
  // カート履歴リストを取得
  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    List<CartModel> cartListHistory = [];
    cartHistory.forEach(
      (element) => cartListHistory.add(
        CartModel.fromJson(
          jsonDecode(element),
        ),
      ),
    );
    return cartListHistory;
  }

  // Add to cart history list
  // カート履歴リストに追加
  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    for (int i = 0; i < cart.length; i++) {
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(
        AppConstants.CART_HISTORY_LIST, cartHistory);
  }

  // Remove cart items if checkout
  // チェックアウト時にカートアイテムを削除
  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }

  // Clear cart history
  // カート履歴をクリア
  void clearCartHistory() {
    removeCart();
    cartHistory = [];
    sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
  }
}
