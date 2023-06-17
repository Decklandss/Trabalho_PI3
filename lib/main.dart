import 'package:flutter/material.dart';
import 'package:libras/src/models/auth.dart';
import 'package:libras/src/routes/app_routes.dart';
import 'package:libras/src/views/auth_of_home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ct) => Auth(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login',
        routes: {
          AppRoutes.AUTH_OF_HOME: (_) => AuthOrHomePage(),
        },
      ),
    );
  }
}
