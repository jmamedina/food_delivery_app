// Cart Controller
// カートコントローラー
import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartController({required this.cartRepo});
  final CartRepo cartRepo;
  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;
  /* only for storage and sharedPreferences */
  List<CartModel> storageItems = [];

  // Add item to cart
  // カートに商品を追加
  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;

        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });
      if (totalQuantity <= 0) {
        _items.remove(product.id!);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(
          product.id!,
          () {
            return CartModel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString(),
              product: product,
            );
          },
        );
      } else {
        Get.snackbar("Order:", "You atleast add an item in the cart",
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
      }
    }
    cartRepo.addToCartList(getItems);
    update();
  }

  // Check if exists in cart
  // カートに存在するかを確認
  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  // Get quantity of product in cart
  // カート内の商品の数量を取得
  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach(
        (key, value) {
          if (key == product.id) {
            quantity = value.quantity!;
          }
        },
      );
    }
    return quantity;
  }

  // Get total items
  // 合計商品数を取得
  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  // Return the list of cart
  // カートのリストを返す
  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  // Get total amount of cart
  // カートの合計金額を取得
  int get totalAmount {
    var total = 0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });

    return total;
  }

  // Get cart items
  // カートのアイテムを取得
  List<CartModel> getCartData() {
    setCart = cartRepo.getCartList();
    return storageItems;
  }

  // Set cart items
  // カートのアイテムを設定
  set setCart(List<CartModel> items) {
    storageItems = items;

    for (int i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }

  // Add to history
  // 履歴に追加
  void addToHistory() {
    cartRepo.addToCartHistoryList();
    clear();
  }

  // Empty items
  // アイテムを空にする
  void clear() {
    _items = {};
    update();
  }

  // List of cart
  // カートのリスト
  List<CartModel> getCartHistoryList() {
    return cartRepo.getCartHistoryList();
  }

  // Set items for the cart history
  // カート履歴のアイテムを設定
  set setItems(Map<int, CartModel> setItems) {
    _items = {};
    _items = setItems;
  }

  // Add to cart List from history
  // 履歴からカートリストに追加
  void addToCartList() {
    cartRepo.addToCartList(getItems);
    update();
  }

  // Clear cart history
  // カート履歴をクリア
  void clearCartHistory() {
    cartRepo.clearCartHistory();
    update();
  }
}
