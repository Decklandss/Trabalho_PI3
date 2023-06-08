import 'package:flutter/material.dart';
import 'package:libras/src/feature/onboarding/components/body.dart';
import 'package:libras/src/feature/onboarding/components/size_config.dart';

class SplashScreen extends StatelessWidget {
    const SplashScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        SizeConfig().init(context);
        return Scaffold(
            body: Body(),
        );
    }
}