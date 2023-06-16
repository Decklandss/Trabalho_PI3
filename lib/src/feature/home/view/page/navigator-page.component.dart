import 'package:flutter/material.dart';

class NavigatorPage extends StatefulWidget {
  NavigatorPage({this.title, required this.child});

  final Widget? title;
  final Widget child;

  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: widget.title,
                centerTitle: true,
                backgroundColor: const Color.fromARGB(164, 211, 238, 185),
              ),
              body: widget.child,
            );
          });
    });
  }
}
