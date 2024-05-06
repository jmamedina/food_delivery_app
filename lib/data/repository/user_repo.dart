// User Repository
// ユーザーリポジトリ
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class UserRepo {
  UserRepo({required this.apiClient});
  final ApiClient apiClient;

  // Get user information
  // ユーザー情報を取得
  Future<Response> getUserInfo() async {
    return await apiClient.getData(AppConstants.USER_INFO_URI);
  }
}
