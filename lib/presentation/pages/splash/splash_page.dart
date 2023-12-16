import 'dart:async';
import 'package:flutter/material.dart';
import 'package:konnect/config/routes/routes.dart';
import 'package:konnect/presentation/manager/assets_manager.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(
              context,
              Routes.homeRoute,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: Colors.yellow,
        child: Image(
          image: AssetImage(ImageAssets.splash),
        ),
      ),
    );
  }
}
