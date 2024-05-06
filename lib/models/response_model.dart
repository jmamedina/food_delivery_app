import 'package:get/get.dart';

// ResponseModel class
// レスポンスモデルクラス
class ResponseModel {
  bool _isSuccess;
  String _message;

  // Constructor
  // コンストラクター
  ResponseModel(this._isSuccess, this._message);

  // Getters
  // ゲッター
  String get message => _message;
  bool get isSuccess => _isSuccess;
}
