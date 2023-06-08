import 'package:libras/src/feature/auth/domain/model/forgot.dart';
import '../../data/repository/forgot_screen_repository.dart';

class ForgotUseCase {
    final repository = ForgotScreenRepository();

    List validateEmail(String email) {
        if (email.isEmpty) {
            return [false, "O email não pode estar em branco."];
        }

        RegExp validEmail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

        if (validEmail.hasMatch(email)) {
            return [true];
        } else {
            return [false, "Insira um email válido."];
        }
    }
    
    Future<Forgot> forgot(String email) {
        if (!validateEmail(email)[0]) {
            final msg = validateEmail(email)[1];
            return Future.error(msg);
        } else {
            return repository.forgot(Forgot(email));
        }
    }
}