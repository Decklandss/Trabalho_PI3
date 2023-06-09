import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:libras/src/feature/auth/domain/usecase/login_screen_usecase.dart';
import 'package:libras/src/feature/auth/presentation/view/page/signup_page.dart';

//import 'signup_page.dart';

class LoginScreen extends StatelessWidget {
  late ColorScheme _colors;
  late Theme Data_theme;

  final loginTextFieldController = TextEditingController();
  final passwordTextFieldController = TextEditingController();
  final loginUseCase = LoginUseCase();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Login")),
        body: Container(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: ListView(children: <Widget>[
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                children: [
                  Text(
                    'username'.i18n(),
                    style: const TextStyle(
                        fontSize: 16, color: Color.fromRGBO(72,118,255,1)),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: TextField(
                        controller: loginTextFieldController,
                        style: const TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(72,118,255,1),
                                  width: 2.0)),
                        )),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                children: [
                  Text(
                    'password'.i18n(),
                    style: const TextStyle(
                        fontSize: 16, color: Color.fromRGBO(72,118,255,1)),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: TextField(
                        obscureText: true,
                        controller: passwordTextFieldController,
                        style: const TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          contentPadding: const EdgeInsets.only(left: 15.0),
                        )),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(
                              width: 2.0,
                              color: Color.fromARGB(255,0,0,0),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255,255,255,255),
                          ),
                          onPressed: () => {
                                loginUseCase
                                    .login(loginTextFieldController.text,
                                        passwordTextFieldController.text)
                                    .then((msg) {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const SplashScreen()));
                                }).catchError((error) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('username_false'.i18n(),
                                            style:
                                                const TextStyle(fontSize: 16)),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              Text("$error",
                                                  style: const TextStyle(
                                                      fontSize: 16)),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text("Ok"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                })
                              },
                          child: Text('login'.i18n(),
                              style: const TextStyle(
                                  color: Color.fromRGBO(72,118,255,1)))),
                    ),
                  )
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(
                              width: 2.0,
                              color: Color.fromARGB(255,0,0,0),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255,255,255,255),
                          ),
                          onPressed: () => {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const SignupScreen()))
                              },
                          child: Text('signup'.i18n(),
                              style: const TextStyle(
                                  color: Color.fromRGBO(72,118,255,1)))),
                    ),
                  )
                ],
              )
            ])));
  }
}
