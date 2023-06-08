import '../../domain/model/user.dart';
import '../../domain/repository/login_screen_interface.dart';
import '../dto/user_dto.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginScreenRepository implements ILogin {
    @override
    Future<User> login(User user) async {
        final dto = UserDto.fromDomain(user);
        final Map<String, dynamic> jsonData = {'key1': 'value1', 'key2': 'value2'};
        final response = await http.post(
          Uri.parse('http://localhost:8082/api/users/auth'),
          headers: <String, String>{'Content-Type': 'application/json'},
          body: jsonEncode(dto.toJson()),                
            );

        if (response.statusCode == 200) {
            final domain = User(user.username, user.password);
            return Future.value(domain);
        } else {
            final msg = "Usuário Incorreto ou Inexistente";
            return Future.error("$msg");
        }
    }
}

