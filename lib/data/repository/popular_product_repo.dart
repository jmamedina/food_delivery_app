// Popular Product Repository
// 人気商品リポジトリ
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  PopularProductRepo({required this.apiClient});
  final ApiClient apiClient;

  // Get popular product list
  // 人気商品リストを取得
  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}
