import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reddit_modular/app/features/pagination/pagination_controller.dart';
import 'package:reddit_modular/app/features/splash/splash_module.dart';
import 'package:reddit_modular/app/service/reddit_service.dart';

import 'features/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => SplashModule()),
    Bind.singleton((i) => HomeModule(i())),
    Bind.singleton((i) => Dio()),
    Bind.singleton((i) => RedditService(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(SplashModule.route, module: SplashModule()),
    ModuleRoute(HomeModule.route, module: HomeModule()),
  ];
}
