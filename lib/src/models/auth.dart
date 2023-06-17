import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:libras/src/exceptions/auth_exception.dart';

class Auth with ChangeNotifier {
  // Variáveis para gerenciamento de token
  String? _token;
  String? _email;
  String? _uid;
  DateTime? _expiryDate;

  // Método para verificar se o usuário está autenticado/logado
  bool get isAuth {
    final isValid = _expiryDate?.isAfter(DateTime.now()) ?? false;
    return _token != null && isValid;
  }

  // Se estiver autenticado, será retornado um token
  String? get token {
    return isAuth ? _token : null;
  }

// Se estiver autenticado, será retornado um email
  String? get email {
    return isAuth ? _email : null;
  }

// Se estiver autenticado, será retornado um uid
  String? get id {
    return isAuth ? _uid : null;
  }

  // Método que realiza autenticação
  Future<void> _authentication(
      String email, String password, String urlFragment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=AIzaSyACkg7x1zigRV_FApKkgnVvGw_AJ_4Ry-Y';
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(
          {'email': email, 'password': password, 'returnSecureToken': true}),
    );

    final body = jsonDecode(response.body);

    // Tratamento de erro de autenticação
    if (body['error'] != null) {
      throw AuthException(body['error']['message']);
    }
    // Gerenciamento de token
    else {
      _token = body['idToken'];
      _email = body['email'];
      _uid = body['localId'];

      _expiryDate = DateTime.now().add(
        Duration(seconds: int.parse(body['expiresIn'])),
      );
      notifyListeners();
    }

    print(body);
  }

  // Método para se inscrever com autenticação
  Future<void> signup(String email, String password) async {
    _authentication(email, password, 'signUp');
  }

  // Método para realizar login com autenticação
  Future<void> login(String email, String password) async {
    _authentication(email, password, 'signInWithPassword');
  }
}
