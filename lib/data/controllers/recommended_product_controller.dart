// Recommended Product Controller
// おすすめ商品コントローラー
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  // Check if it is already loaded
  // すでに読み込まれているかを確認
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  // Get recommended product list
  // おすすめ商品リストを取得
  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      print("no recommended products");
    }
  }
}
