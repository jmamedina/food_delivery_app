import 'package:get/get.dart';

// Dimensions class
// Dimensionsクラス
class Dimensions {
  // Screen dimensions
  // 画面の寸法
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  // Page view dimensions
  // ページビューの寸法
  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

  // Dynamic heights (based on screenHeight of 844)
  // 動的な高さ（スクリーンの高さ844に基づく）
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;

  // Dynamic widths (based on screenHeight of 844) for padding and margin
  // 動的な幅（スクリーンの高さ844に基づく）：パディングとマージン用
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;
  static double width45 = screenHeight / 18.76;

  // Font sizes
  // フォントサイズ
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

  // Radius sizes
  // 半径のサイズ
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  // Icon sizes
  // アイコンサイズ
  static double iconSize15 = screenHeight / 56.27;
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.75;

  // List view sizes
  // リストビューサイズ
  static double listViewImageSize = screenWidth / 3.25;
  static double listViewTextContSize = screenWidth / 3.9;

  // Popular food dimensions
  // 人気商品の寸法
  static double popularFoodImgSize = screenHeight / 2.41;

  // Bottom height
  // ボトムの高さ
  static double bottomHeightBar = screenHeight / 6.03;

  // Splash screen dimensions
  // スプラッシュ画面の寸法
  static double splashImage = screenHeight / 3.38;
}
