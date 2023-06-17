import 'package:flutter/material.dart';
import 'package:libras/src/models/auth.dart';
import 'package:libras/src/views/auth_page.dart';
import 'package:libras/src/views/home.dart';
import 'package:provider/provider.dart';

class AuthOrHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Navegação de telas se o usuário estiver autenticado ou não
    Auth auth = Provider.of(context);
    return auth.isAuth ? Home() : AuthPage();
  }
}
