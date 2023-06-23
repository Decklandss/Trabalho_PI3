import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestos'),
        centerTitle: true,
      ),
      body: Container(
        child: Text('Gestos em Java'),
      ),
    );
  }
}
