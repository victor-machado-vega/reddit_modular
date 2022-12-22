import 'dart:math';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:reddit_modular/app/service/reddit_service.dart';

import '../../core/core.dart';
import '../../shared/models/filter_model.dart';
import '../../shared/models/post_model.dart';
import 'package:dio/dio.dart';

import '../../shared/util/toast_util.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  @observable
  bool isLoading = false, reverseList = false;

  @observable
  List<Post> posts = [];

  @observable
  List _response = [];

  //Pre-created list filter items
  @observable
  List<Filter> filters = [
    Filter(
      color: AppColors.primary1,
      label: "androiddev",
      isSelected: false,
    ),
    Filter(
      color: AppColors.red_0,
      label: "aplicativos",
      isSelected: false,
    ),
    Filter(
      color: AppColors.green_water,
      label: "FlutterDev",
      isSelected: false,
    ),
    Filter(
      color: AppColors.orange,
      label: "learnjavascript",
      isSelected: false,
    ),
  ];

  @action
  Future<void> searchTerm(String term) async {
    try {
      isLoading = true;
      // Removendo textos caso existam
      if (term.contains("r/")) {
        term.replaceAll("r/", "");
      } else if (term.contains("/r/")) {
        term.replaceAll("/r/", "");
      }
      // Caso o texto digitado tenha espaço
      if (term.contains(" ")) {
        term.replaceAll(" ", "");
      }
      var responseData = await RedditService().getContent(term);
      _response.clear();
      posts.clear();

      _response.addAll(responseData['data']['children']);

      _response.forEach(
        (post) {
          posts.add(
            Post(
              id: post['data']['id'],
              subreddit: post['data']['subreddit'],
              author: post['data']['author'],
              title: post['data']['title'],
              imagePath:
                  'https://www.redditstatic.com/avatars/defaults/v2/avatar_default_${Random().nextInt(7)}.png',
              thumbnailPath: '${post['data']['thumbnail']}',
              upvotes: ' ${post['data']['ups']} ',
              answers: [],
            ),
          );
        },
      );

      print('Tamanho da Lista: ${posts.length}');
      bool addOnFilterList = true;
      if (posts.length >= 1) {
        filters.forEach((element) {
          element.isSelected = false;
          if (term == element.label) {
            addOnFilterList = false;
            element.isSelected = true;
          }
        });

        if (addOnFilterList) {
          reverseList = true;
          filters.add(
            Filter(
              color: AppColors.correct,
              label: term,
              isSelected: true,
            ),
          );
        }
      } else {
        ToastUtil.showToast(
          "Nenhum resultado encontrado! verifique se digitou corretamente",
          Toast.LENGTH_SHORT,
        );
      }
      isLoading = false;
    } catch (e) {
      print(e);
      isLoading = false;
      // return null;
    } finally {
      isLoading = false;
    }
  }
}
