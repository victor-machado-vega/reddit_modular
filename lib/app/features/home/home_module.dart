import 'package:flutter_modular/flutter_modular.dart';
import 'package:reddit_modular/app/features/home/home_page.dart';

import 'home_controller.dart';

class HomeModule extends Module {
  static const route = '/home';

  @override
  final List<Bind> binds = [
    Bind.singleton<HomeController>((i) => HomeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(route, child: (_, args) => const HomePage()),
  ];
}
