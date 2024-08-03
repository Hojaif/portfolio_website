import 'dart:async';
import 'package:flutter/material.dart';
import 'package:protfolioweb/src/presentation/views/HomeScreen.dart';
import 'package:protfolioweb/src/presentation/views/Splash/Loding.dart';

import '../../../utils/Colors.dart';
import '../TabBar/Dashboard/Componets/AnimatedImageContainer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Homescreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedImageContainer(
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: defaultPadding,
            ),
            AnimatedLoading(),
          ],
        ),
      ),
    );
  }
}
