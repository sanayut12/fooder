//ค่าที่ส่งให้ server ไปที่ /user/register โดย method post
class RegisterRequest {
  final String name;
  final String phone;
  final String email;
  final String password;

  RegisterRequest({this.name, this.phone, this.email, this.password});
}

//ค่าส่งคืน server ที่ /user/register
class RegisterResponse {
  final String key;
  final int code;
  final String message;
  RegisterResponse({this.message, this.key, this.code});
}

class ConfirmRegisterRequest {
  final String phone;
  final String code;
  ConfirmRegisterRequest({this.phone, this.code});
}

class ConfirmRegisterResponse {
  final String message;
  final String key;
  final int code;
  ConfirmRegisterResponse({this.message, this.key, this.code});
}
