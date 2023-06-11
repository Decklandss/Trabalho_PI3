import 'package:dio/dio.dart';
import 'package:libras/src/feature/auth/data/dto/signup_dto.dart';
import 'package:libras/src/feature/auth/domain/model/signup.dart';
import '../../domain/repository/signup_screen_interface.dart';

class SignupScreenRepository implements ISignup {
  @override
  Future<SignupUser> signup(SignupUser user) async {
    final dto = SignUpDto.fromDomain(user);
    final response = await Dio().post(
      'http://10.0.2.2:3000/singnup',
      queryParameters: dto.toJson(),
    );
    if (response.statusCode == 200) {
      final token = response.headers.value('Authorization');
      final domain = SignupUser(
          user.username,
          user.email,
          user.password,
          user.confirmPassword,
          token: token);
      return Future.value(domain);
    } else {
      throw Exception(response.headers['Message']);
    }
  }
}
