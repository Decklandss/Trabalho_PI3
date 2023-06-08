class Forgot {
    const Forgot(this.email, {this.token});
    
    final String email;
    final String? token;

    factory Forgot.fromJson(Map<String, dynamic> json) =>
        Forgot(json['email'], token: json['token']);
}