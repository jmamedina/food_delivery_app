// Auth Controller
// 認証コントローラー
import 'package:food_delivery/data/repository/auth_repo.dart';
import 'package:food_delivery/models/response_model.dart';
import 'package:food_delivery/models/signup_body_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Shared Preferences instance
  // 共有プリファレンスのインスタンス
  get sharedPreferences => null;

  // Registration process
  // 登録プロセス
  Future<ResponseModel> registration(SignUpBody signUpBody) async {
    _isLoading = true; // Start loading indicator // ローディングインジケータを開始
    update(); // Update UI // UI を更新

    // Call registration API // 登録 API を呼び出す
    Response response = await authRepo.registration(signUpBody);

    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      // Save user token if registration successful // 登録成功時はユーザートークンを保存
      authRepo.saveUserToken(
        response.body["token"],
      );
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      // If registration fails, create response model with error message // 登録失敗時はエラーメッセージを含むレスポンスモデルを作成
      responseModel = ResponseModel(false, response.statusText!);
    }

    _isLoading = false; // Stop loading indicator // ローディングインジケータを停止
    update(); // Update UI // UI を更新

    return responseModel;
  }

  // Login process
  // ログインプロセス
  Future<ResponseModel> login(String email, String password) async {
    _isLoading = true; // Start loading indicator // ローディングインジケータを開始
    update(); // Update UI // UI を更新

    // Call login API // ログイン API を呼び出す
    Response response = await authRepo.login(email, password);

    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      // Save user token if login successful // ログイン成功時はユーザートークンを保存
      authRepo.saveUserToken(
        response.body["token"],
      );

      responseModel = ResponseModel(true, response.body["token"]);
      print(response.body["token"].toString());
    } else {
      // If login fails, create response model with error message // ログイン失敗時はエラーメッセージを含むレスポンスモデルを作成
      print(response.statusCode);
      responseModel = ResponseModel(false, response.statusText!);
    }

    _isLoading = false; // Stop loading indicator // ローディングインジケータを停止
    update(); // Update UI // UI を更新

    return responseModel;
  }

  // Save user number and password
  // ユーザーの電話番号とパスワードを保存
  void saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }

  // Check if user is logged in
  // ユーザーがログインしているかどうかをチェック
  bool userLoggedIn() {
    return authRepo.userLoggedIn();
  }

  // Clear shared data
  // 共有データをクリア
  bool clearSharedData() {
    return authRepo.clearSharedData();
  }
}
