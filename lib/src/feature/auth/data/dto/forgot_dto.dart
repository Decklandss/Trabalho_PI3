import 'package:libras/src/feature/auth/domain/model/forgot.dart';

class ForgotDto {
    const ForgotDto(this.email);

    final String email;

    factory ForgotDto.fromDomain(Forgot user) {
        return ForgotDto(user.email);
    }

    factory ForgotDto.fromJson(Map<String, dynamic> json) =>
        ForgotDto(json['email']);

    Map<String, dynamic> toJson() => {'email': email};
}