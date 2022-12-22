import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reddit_modular/app/features/home/home_controller.dart';
import 'package:reddit_modular/app/features/pagination/pagination_controller.dart';

import '../../core/core.dart';
import '../home/widget/post_list_item_widget.dart';

class PaginationWidget extends StatefulWidget {
  const PaginationWidget({Key? key}) : super(key: key);

  @override
  _PaginationWidgetState createState() => _PaginationWidgetState();
}

class _PaginationWidgetState
    extends ModularState<PaginationWidget, PaginationController> {
  @override
  void initState() {
    super.initState();

    // Capturando a instancia do HomeController e passando
    // para o nosso controller de paginacao
    // var homeController = Modular.get<HomeController>();
    print('Carregando lista inicial');
    controller.loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        children: [
          controller.isLoading
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * .6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary_0,
                        ),
                      ),
                      Text(
                        "Pesquisando Termo...",
                        style: AppTextStyles.h6_regular,
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height * .6,
                  child: Observer(
                    builder: (_) => ListView.builder(
                      itemCount: controller.posts.length,
                      itemBuilder: (context, index) => PostListItemWidget(
                        post: controller.posts.elementAt(index),
                      ),
                    ),
                  ),
                ),
          Observer(builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${controller.firstItemIndex} - ${controller.lastItemIndex}',
                  style: AppTextStyles.h7_regular,
                ),
                IconButton(
                  onPressed: () => controller.onPreviousPage(),
                  icon: Icon(
                    Icons.arrow_circle_left_outlined,
                    size: 28,
                    color: AppColors.primary_0,
                  ),
                ),
                IconButton(
                  onPressed: () => controller.onNextPage(),
                  icon: Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 28,
                    color: AppColors.primary_0,
                  ),
                ),
              ],
            );
          }),
        ],
      );
    });
  }
}
