

class ResetPasswordRequestModel {
  String? password;

  ResetPasswordRequestModel({this.password});

  ResetPasswordRequestModel.fromJson(Map<String, dynamic> json) {
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    return data;
  }
}
