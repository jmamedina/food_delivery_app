// Recommended Product Repository
// おすすめ商品リポジトリ
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  RecommendedProductRepo({required this.apiClient});
  final ApiClient apiClient;

  // Get recommended product list
  // おすすめ商品リストを取得
  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
