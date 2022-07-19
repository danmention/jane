class SignupRequest {
  String? email;
  String? password;
  String? fullname;

  SignupRequest({this.email, this.password, this.fullname});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['fullname'] = this.fullname;
    return data;
  }
}