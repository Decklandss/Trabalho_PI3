import 'package:libras/src/feature/auth/data/repository/login_screen_repository.dart';
import '../model/user.dart';

class LoginUseCase {
    final repository = LoginScreenRepository();

    List validateUsername(String username) {
        if (username.isEmpty) {
            return [false, 'O campo usuario não pode estar em branco.'];
        }

        return [true];
    }

    List validatePassword(String password) {
        if (password.isEmpty) {
            return [false, 'A senha não pode estar em branco.'];
        }
        return [true];
    }

    Future<User> login(String username, String password) {
        if (!validateUsername(username)[0]) {
            final errorMsg = validateUsername(username)[1];
            return Future.error("$errorMsg");
        }

        if (!validatePassword(password)[0]) {
            final errorMsg = validatePassword(password)[1];
            return Future.error("$errorMsg");
        }

        return repository.login(User(username, password));
    }
}