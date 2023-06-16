import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:libras/src/feature/auth/domain/usecase/signup_screen_usecase.dart';

import 'login_page.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var usernameTextFieldController = TextEditingController();

  var nameTextFieldController = TextEditingController();

  var emailTextFieldController = TextEditingController();

  var passwordTextFieldController = TextEditingController();

  var confirmPasswordTextFieldController = TextEditingController();

  var signupUseCase = SignupUseCase();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'app_name'.i18n(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: null,
            body: Container(
              padding: const EdgeInsets.only(left: 40, right: 40),
              width: double.infinity,
              height: double.infinity,
              child: ListView(children: <Widget>[
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      'User'.i18n(),
                      style: const TextStyle(
                          fontSize: 16, color: Color.fromRGBO(39, 64, 139, 1)),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Flexible(
                    child: TextField(
                      controller: usernameTextFieldController,
                      textAlignVertical: TextAlignVertical.center,
                      style: const TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        contentPadding: const EdgeInsets.only(left: 15.0),
                      ),
                    ),
                  ),
                ]),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      'name'.i18n(),
                      style: const TextStyle(
                          fontSize: 16, color: Color.fromRGBO(39, 64, 139, 1)),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: TextField(
                        controller: nameTextFieldController,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          contentPadding: const EdgeInsets.only(left: 15.0),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      'email'.i18n(),
                      style: const TextStyle(
                          fontSize: 16, color: Color.fromRGBO(39, 64, 139, 1)),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: TextField(
                          controller: emailTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
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
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      'password'.i18n(),
                      style: const TextStyle(
                          fontSize: 16, color: Color.fromRGBO(39, 64, 139, 1)),
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
                          textAlignVertical: TextAlignVertical.center,
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
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      'confirm_password'.i18n(),
                      style: const TextStyle(
                          fontSize: 16, color: Color.fromRGBO(39, 64, 139, 1)),
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
                          controller: confirmPasswordTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
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
                          onPressed: () => {
                            signupUseCase
                                .signup(
                                    usernameTextFieldController.text,
                                    //nameTextFieldController.text,
                                    emailTextFieldController.text,
                                    passwordTextFieldController.text,
                                    confirmPasswordTextFieldController.text)
                                .then((msg) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('register_True'.i18n(),
                                        style: TextStyle(fontSize: 16)),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: const <Widget>[
                                          Text(""),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Ok',
                                            style: TextStyle(fontSize: 16)),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginScreen()));
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }).catchError((error) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('register_False'.i18n(),
                                        style: const TextStyle(fontSize: 16)),
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
                                        child: const Text('Ok',
                                            style: TextStyle(fontSize: 16)),
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
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(
                              width: 2.0,
                              color: Color.fromRGBO(108, 166, 205, 1),
                            ),
                            backgroundColor:
                                const Color.fromRGBO(108, 166, 205, 1),
                          ),
                          child: Text('register'.i18n(),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255))),
                        ),
                      ),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
              ]),
            )));
  }
}
