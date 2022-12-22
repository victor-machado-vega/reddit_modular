import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:reddit_modular/app/features/home/home_page.dart';
import 'package:reddit_modular/app/features/pagination/pagination_controller.dart';

import 'home_controller.dart';

class HomeModule extends Module {
  static const route = '/home';

  @override
  final List<Bind> binds = [
    Bind.singleton<HomeController>((i) => HomeController()),
    Bind.singleton<PaginationController>((i) => PaginationController(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(route, child: (_, args) => const HomePage()),
  ];
}
