import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reddit_modular/app/features/splash/splash_module.dart';

import 'core/core.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashModule.route,
      color: Colors.blueGrey,
    ).modular();
  }
}
