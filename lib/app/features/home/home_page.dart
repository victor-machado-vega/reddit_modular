import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:reddit_modular/app/core/core.dart';
import 'package:reddit_modular/app/features/home/home_controller.dart';
import 'package:reddit_modular/app/features/home/widget/post_list_item_widget.dart';
import 'package:reddit_modular/app/shared/widgets/input_widget.dart';

import '../../shared/widgets/filter_list_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();

    controller.searchTerm(
      controller.filters.elementAt(2).label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey_02,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 32,
            bottom: 64,
          ),
          child: Observer(builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                controller.isLoading
                    ? Column(
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
                      )
                    : Column(
                        children: [
                          Column(
                            children: [
                              InputWidget.icon(
                                label: "",
                                hint: "Pesquisar por subreddit",
                                controller: searchController,
                                icon: IconButton(
                                  onPressed: () => controller
                                      .searchTerm(searchController.text),
                                  icon: Icon(
                                    Icons.search,
                                    size: 28,
                                    color: AppColors.primary_0,
                                  ),
                                ),
                              ),
                              Observer(
                                builder: (context) {
                                  return Row(
                                    children: [
                                      Text(
                                        "Resultados de: ",
                                        style: AppTextStyles.p_bold,
                                      ),
                                      SizedBox(
                                        height: 32,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .6,
                                        child: ListView.builder(
                                          reverse: controller.reverseList,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller.filters.length,
                                          cacheExtent: 400,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return FilterListItemWidget(
                                                filter: controller.filters
                                                    .elementAt(index),
                                                onTap: () {
                                                  controller.filters
                                                      .forEach((element) {
                                                    element.isSelected = false;

                                                    if (element ==
                                                        controller.filters
                                                            .elementAt(index)) {
                                                      element.isSelected = true;
                                                    }
                                                    setState(() {});
                                                  });

                                                  controller.searchTerm(
                                                    controller.filters
                                                        .elementAt(index)
                                                        .label,
                                                  );
                                                  // searchTerm(
                                                  //  controller.filters.elementAt(index).label,
                                                  // );
                                                });
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .7,
                            child: Observer(
                              builder: (_) => ListView.builder(
                                itemCount: controller.posts.length,
                                itemBuilder: (context, index) =>
                                    PostListItemWidget(
                                  post: controller.posts.elementAt(index),
                                ),
                                // Container(
                                //   margin:
                                //       const EdgeInsets.symmetric(vertical: 8),
                                //   padding: const EdgeInsets.symmetric(
                                //     horizontal: 16,
                                //     vertical: 8,
                                //   ),
                                //   decoration: BoxDecoration(
                                //     color: AppColors.white,
                                //     borderRadius: BorderRadius.circular(4),
                                //   ),
                                //   child: Text(
                                //     'Index: $index',
                                //     style: AppTextStyles.h6_bold,
                                //   ),
                                // ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
