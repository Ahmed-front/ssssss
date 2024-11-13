class Login {
  bool status;
  Login({required this.status});
  factory Login.fromJson(Map json) {
    return Login(status: json["status"]);
  }
}