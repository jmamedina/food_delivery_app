// Initialize Function
// 初期化関数
import 'dart:ffi';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/controllers/auth_controller.dart';
import 'package:food_delivery/data/controllers/cart_controller.dart';
import 'package:food_delivery/data/controllers/location_controller.dart';
import 'package:food_delivery/data/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/controllers/recommended_product_controller.dart';
import 'package:food_delivery/data/controllers/user_controller.dart';
import 'package:food_delivery/data/repository/auth_repo.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/data/repository/location_repo.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:food_delivery/data/repository/user_repo.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Void?> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  // Api client
  // APIクライアント
  Get.lazyPut(
    () => ApiClient(
        appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()),
  );

  // Repositories
  // リポジトリ
  // Popular product repository
  // 人気商品リポジトリ
  Get.lazyPut(
    () => PopularProductRepo(
      apiClient: Get.find(),
    ),
  );

  // Recommended product repository
  // おすすめ商品リポジトリ
  Get.lazyPut(
    () => RecommendedProductRepo(
      apiClient: Get.find(),
    ),
  );

  // Cart repository
  // カートリポジトリ
  Get.lazyPut(
    () => CartRepo(sharedPreferences: Get.find()),
  );

  // Auth repository
  // 認証リポジトリ
  Get.lazyPut(
    () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()),
  );

  // User repository
  // ユーザーリポジトリ
  Get.lazyPut(
    () => UserRepo(apiClient: Get.find()),
  );

  // Location repository
  // ロケーションレポジトリ
  Get.lazyPut(
    () => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()),
  );

  // Controllers
  // コントローラー
  // Popular product controller
  // 人気商品コントローラー
  Get.lazyPut(
    () => PopularProductController(
      popularProductRepo: Get.find(),
    ),
  );

  // Recommended product controller
  // おすすめ商品コントローラー
  Get.lazyPut(
    () => RecommendedProductController(
      recommendedProductRepo: Get.find(),
    ),
  );

  // Cart controller
  // カートコントローラー
  Get.lazyPut(
    () => CartController(
      cartRepo: Get.find(),
    ),
  );

  // Auth controller
  // 認証コントローラー
  Get.lazyPut(
    () => AuthController(
      authRepo: Get.find(),
    ),
  );

  // User controller
  // ユーザーコントローラー
  Get.lazyPut(
    () => UserController(
      userRepo: Get.find(),
    ),
  );

  // Location controller
  // ロケーションコントローラー
  Get.lazyPut(
    () => LocationController(
      locationRepo: Get.find(),
    ),
  );

  return null;
}
