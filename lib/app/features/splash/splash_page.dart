import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:reddit_modular/app/core/core.dart';
import 'package:reddit_modular/app/features/splash/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  @override
  void initState() {
    super.initState();
    controller.awaitAndChangePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
              "https://assets2.lottiefiles.com/packages/lf20_zoe5oujy.json",
              height: 120,
            ),
            Text(
              'Reddit Client',
              style: AppTextStyles.h5_bold,
            ),
          ],
        ),
      ),
    );
  }
}
