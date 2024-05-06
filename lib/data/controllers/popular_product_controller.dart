// Popular Product Controller
// 人気商品コントローラー
import 'package:flutter/material.dart';
import 'package:food_delivery/data/controllers/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cart;

  // Check if it is already loaded
  // すでに読み込まれているかを確認
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  // Order quantity
  // 注文数
  int _quantity = 0;
  int get quantity => _quantity;

  // In cart items
  // カート内のアイテム数
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  // Get popular product list
  // 人気商品リストを取得
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      print("no products");
    }
  }

  // Order quantity
  // 注文数の設定
  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  // Check quantity
  // 数量のチェック
  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar("Order:", "You can't reduce more.",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);

      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }

      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar("Order:", "You can't add more.",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  // Initialize product
  // 商品の初期化
  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
  }

  // Add item in cart
  // カートに商品を追加
  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    update();
  }

  // Get total items
  // 合計商品数を取得
  int get totalItems {
    return _cart.totalItems;
  }

  // List in cart
  // カート内のリストを取得
  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
