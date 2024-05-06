// SignUpBody class
// サインアップボディクラス
class SignUpBody {
  String name;
  String phone;
  String email;
  String password;

  // Constructor
  // コンストラクター
  SignUpBody({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  // Serialize object to JSON
  // オブジェクトをJSONにシリアル化
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["f_name"] = this.name;
    data["phone"] = this.phone;
    data["email"] = this.email;
    data["password"] = this.password;
    return data;
  }
}
