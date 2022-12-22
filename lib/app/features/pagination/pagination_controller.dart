import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:reddit_modular/app/features/home/home_controller.dart';

part 'pagination_controller.g.dart';

class PaginationController = _PaginationBase with _$PaginationController;

abstract class _PaginationBase with Store {
  final HomeController _homeController;
  _PaginationBase(this._homeController);

  @observable
  List posts = [], _backupList = [];

  @observable
  bool _isFirstPage = true, _isLastPage = false, isLoading = false;

  @observable
  var _page = 1, _limit = 10;

  @observable
  int firstItemIndex = 0, lastItemIndex = 10;

  @action
  Future<void> loadInitialData() async {
    _backupList.clear();
    _backupList.addAll(_homeController.posts);
    posts.addAll(_backupList.take(_limit));
  }

  @action
  Future<void> loadListData() async {
    // if (_isFirstPage) {
    //   _backupList.addAll(_homeController.posts);
    // } else {
    //   _backupList.clear();
    // }

    posts.addAll(_backupList.take(_limit));
  }

  @action
  Future<void> onPreviousPage() async {
    // _homeController.isLoading = true;
    isLoading = !isLoading;

    if (firstItemIndex != 0) {
      isLoading = !isLoading;

      _backupList.clear();
      _backupList.addAll(_homeController.posts);
      firstItemIndex = 0;
      lastItemIndex = 10;

      _isFirstPage = true;

      await loadListData();
    }

    await Future.delayed(const Duration(milliseconds: 500)).then(
      (_) => {
        isLoading = !isLoading,
        // _homeController.isLoading = false,
      },
    );
  }

  @action
  Future<void> onNextPage() async {
    isLoading = true;
    // _homeController.isLoading = true;

    posts.forEach((element) {
      _backupList.remove(element);
      print('> Removendo Item');
    });

    firstItemIndex = lastItemIndex;

    print('> NextPage');

    if (_backupList.length <= 10) {
      _limit = _backupList.length;
      lastItemIndex += _limit;
      _isLastPage = true;
    } else {
      lastItemIndex += 10;
      _limit = 10;
    }

    print('Item total: $lastItemIndex');

    lastItemIndex = lastItemIndex + _limit;

    posts.clear();

    await loadListData();
    await Future.delayed(const Duration(milliseconds: 500)).then(
      (_) => {
        isLoading = !isLoading,
        // _homeController.isLoading = false,
      },
    );
  }
}
