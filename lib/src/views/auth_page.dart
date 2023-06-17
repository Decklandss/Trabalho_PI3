import 'package:flutter/material.dart';
import 'package:libras/src/components/auth_form.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(117, 177, 255, 0.498),
                  Color.fromRGBO(195, 255, 117, 0.898),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 100,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 70,
                  ),
                  child: Text(
                    'Projeto Integrador',
                    style: TextStyle(
                      fontSize: 45,
                      fontFamily: 'Anton',
                      color: Colors.black26,
                    ),
                  ),
                ),
                AuthForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
