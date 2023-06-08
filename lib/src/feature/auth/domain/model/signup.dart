class SignupUser {
    const SignupUser(this.username, this.email, this.password,
      this.confirmPassword, {this.token});

  final String username;
  final String email;
  final String password;
  final String confirmPassword;
  final String? token;

    factory SignupUser.fromJson(Map<String, dynamic> json) => SignupUser(
      json['username'],
      json['email'],
      json['password'], 
      json['confirmPassword'], 
        token: json['token']);
}
