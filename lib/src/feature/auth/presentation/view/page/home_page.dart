import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class HomePages extends StatelessWidget {
    const HomePages({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text('app_name'.i18n())),
        );
    }
}
