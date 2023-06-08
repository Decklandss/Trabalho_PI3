import 'dart:math';
import 'package:libras/src/feature/auth/data/dto/signup_dto.dart';
import 'package:libras/src/feature/auth/domain/model/signup.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/repository/signup_screen_interface.dart';

class SignupScreenRepository implements ISignup {
    @override
    Future<SignupUser> signup(SignupUser user) async {
        final dto = SignUpDto.fromDomain(user);
        final response = await http.post(
          Uri.parse('http://localhost:8082/api/users'),
          headers: <String, String>{'Content-Type': 'application/json'},
          body: jsonEncode(dto.toJson()),
          );
        
        if (response.statusCode == 200 || response.statusCode == 201 ) {
            print( response.headers);
            final domain = SignupUser(user.username, user.email, 
                user.password, user.confirmPassword);
            return Future.value(domain);
        } else {
            throw Exception(response.headers['Message']);
        }
    }
}
