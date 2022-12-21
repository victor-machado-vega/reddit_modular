import 'package:flutter_modular/flutter_modular.dart';
import 'package:reddit_modular/app/features/splash/splash_controller.dart';

import 'splash_page.dart';
import 'splash_controller.dart';

class SplashModule extends Module {
  static const route = '/splash';

  @override
  final List<Bind> binds = [
    Bind.singleton<SplashController>((i) => SplashController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SplashPage()),
  ];
}
