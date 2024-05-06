// RouteHelper class
// ルートヘルパークラス
import 'package:food_delivery/pages/address/add_address_page.dart';
import 'package:food_delivery/pages/auth/sign_in_page.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:food_delivery/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  // splash page route
  static const String splashPage = "/splash-page";

  // home page route
  static const String initial = "/";

  // popular food route
  static const String popularFood = "/popular-food";

  // recommended food route
  static const String recommended = "/recommended-food";

  // cart page route
  static const String cartPage = "/cart-page";

  //sign in route
  static const String signInPage = "/sign-in";

  //add address route
  static const String addAddress = "/add-address";

  // Get route paths
  // ルートパスを取得する

  //splash page
  static String getSplashPage() => '$splashPage';

  //home page
  static String getInitial() => '$initial';

  //popular food page
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';

  //recommended food page
  static String getRecommendedFood(int pageId, String page) =>
      '$recommended?pageId=$pageId&page=$page';

  //cart page
  static String getCartPage() => '$cartPage';

  // sign in page
  static String getSignInPage() => '$signInPage';

  //address page
  static String getAddressPage() => '$addAddress';

  // Define routes
  // ルートを定義する
  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => HomePage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: recommended,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];

        return RecommendedFoodDetail(
          pageId: int.parse(pageId!),
          page: page!,
        );
      },
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: cartPage,
      page: () {
        return CartPage();
      },
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: splashPage,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: signInPage,
      page: () => SignInPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: addAddress,
      page: () => AddAddressPage(),
      transition: Transition.rightToLeft,
    ),
  ];
}
