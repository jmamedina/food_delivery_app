// AppConstants class
// AppConstantsクラス
class AppConstants {
  // Application constants
  // アプリケーションの定数
  static const String APP_NAME = "FoodoExpress";
  static const int APP_VERSION = 1;
  static const String BASE_URL = "http://192.168.0.12:10081";
  static const String UPLOAD_URL = "/uploads/";

  // Product endpoints
  // 商品エンドポイント
  static const String POPULAR_PRODUCT_URI = "/api/v1/products/popular";
  static const String RECOMMENDED_PRODUCT_URI = "/api/v1/products/recommended";

  // Authentication endpoints
  // 認証エンドポイント
  static const String REGISTRATION_URI = "/api/v1/auth/register";
  static const String LOGIN_URI = "/api/v1/auth/login";
  static const String USER_INFO_URI = "/api/v1/customer/info";

  // Authentication tokens
  // 認証トークン
  static const String PHONE = "";
  static const String PASSWORD = "";
  static const String TOKEN = "test";

  // Shared preferences keys
  // 共有プリファレンスのキー
  static const String CART_LIST = "cart-list";
  static const String CART_HISTORY_LIST = "cart-history-list";

  // Geocode
  static const String USER_ADDRESS = "user_address";
  static const String GEOCODE_URI = "/api/v1/config_geocode-api";
}
