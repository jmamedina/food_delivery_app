// Auth Repository
// 認証リポジトリ
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/models/signup_body_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  // Registration process
  // 登録プロセス
  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(
        AppConstants.REGISTRATION_URI, signUpBody.toJson());
  }

  // Login process
  // ログインプロセス
  Future<Response> login(String email, String password) async {
    print("email " + email);
    print("passowrd " + password);

    return await apiClient.postData(
        AppConstants.LOGIN_URI, {"email": email, "password": password});
  }

  // Save user token
  // ユーザートークンを保存
  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    print("hey");
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  // Get user token
  // ユーザートークンを取得
  Future<String> getUserToken() async {
    return await sharedPreferences.getString(AppConstants.TOKEN) ?? "None";
  }

  // Check if user logged in
  // ユーザーがログインしているかどうかを確認
  bool userLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  // Save user number and password
  // ユーザーの電話番号とパスワードを保存
  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.PHONE, number);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    } catch (e) {
      throw e;
    }
  }

  // Clear shared data
  // 共有データをクリア
  bool clearSharedData() {
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.PASSWORD);
    sharedPreferences.remove(AppConstants.PHONE);
    apiClient.token = "";
    apiClient.updateHeader("");

    return true;
  }
}
