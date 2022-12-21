import 'package:flutter_modular/flutter_modular.dart';
import 'package:reddit_modular/app/features/splash/splash_module.dart';

import 'features/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => SplashModule()),
    Bind.singleton((i) => HomeModule()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(SplashModule.route, module: SplashModule()),
    ModuleRoute(HomeModule.route, module: HomeModule()),
  ];
}
