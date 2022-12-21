import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashBase with _$SplashController;

abstract class _SplashBase with Store {
  @observable
  bool isLoading = true;

  @action
  void setIsLoading() {
    isLoading = false;
  }

  Future<void> awaitAndChangePage() async {
    await Future.delayed(Duration(seconds: 3)).then((_) => {
          Modular.to.popAndPushNamed("/home"),
        });
  }
}
