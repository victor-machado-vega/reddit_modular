// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaginationController on _PaginationBase, Store {
  late final _$postsAtom =
      Atom(name: '_PaginationBase.posts', context: context);

  @override
  List<dynamic> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(List<dynamic> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  late final _$_backupListAtom =
      Atom(name: '_PaginationBase._backupList', context: context);

  @override
  List<dynamic> get _backupList {
    _$_backupListAtom.reportRead();
    return super._backupList;
  }

  @override
  set _backupList(List<dynamic> value) {
    _$_backupListAtom.reportWrite(value, super._backupList, () {
      super._backupList = value;
    });
  }

  late final _$_isFirstPageAtom =
      Atom(name: '_PaginationBase._isFirstPage', context: context);

  @override
  bool get _isFirstPage {
    _$_isFirstPageAtom.reportRead();
    return super._isFirstPage;
  }

  @override
  set _isFirstPage(bool value) {
    _$_isFirstPageAtom.reportWrite(value, super._isFirstPage, () {
      super._isFirstPage = value;
    });
  }

  late final _$_isLastPageAtom =
      Atom(name: '_PaginationBase._isLastPage', context: context);

  @override
  bool get _isLastPage {
    _$_isLastPageAtom.reportRead();
    return super._isLastPage;
  }

  @override
  set _isLastPage(bool value) {
    _$_isLastPageAtom.reportWrite(value, super._isLastPage, () {
      super._isLastPage = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PaginationBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_pageAtom =
      Atom(name: '_PaginationBase._page', context: context);

  @override
  int get _page {
    _$_pageAtom.reportRead();
    return super._page;
  }

  @override
  set _page(int value) {
    _$_pageAtom.reportWrite(value, super._page, () {
      super._page = value;
    });
  }

  late final _$_limitAtom =
      Atom(name: '_PaginationBase._limit', context: context);

  @override
  int get _limit {
    _$_limitAtom.reportRead();
    return super._limit;
  }

  @override
  set _limit(int value) {
    _$_limitAtom.reportWrite(value, super._limit, () {
      super._limit = value;
    });
  }

  late final _$firstItemIndexAtom =
      Atom(name: '_PaginationBase.firstItemIndex', context: context);

  @override
  int get firstItemIndex {
    _$firstItemIndexAtom.reportRead();
    return super.firstItemIndex;
  }

  @override
  set firstItemIndex(int value) {
    _$firstItemIndexAtom.reportWrite(value, super.firstItemIndex, () {
      super.firstItemIndex = value;
    });
  }

  late final _$lastItemIndexAtom =
      Atom(name: '_PaginationBase.lastItemIndex', context: context);

  @override
  int get lastItemIndex {
    _$lastItemIndexAtom.reportRead();
    return super.lastItemIndex;
  }

  @override
  set lastItemIndex(int value) {
    _$lastItemIndexAtom.reportWrite(value, super.lastItemIndex, () {
      super.lastItemIndex = value;
    });
  }

  late final _$loadInitialDataAsyncAction =
      AsyncAction('_PaginationBase.loadInitialData', context: context);

  @override
  Future<void> loadInitialData() {
    return _$loadInitialDataAsyncAction.run(() => super.loadInitialData());
  }

  late final _$loadListDataAsyncAction =
      AsyncAction('_PaginationBase.loadListData', context: context);

  @override
  Future<void> loadListData() {
    return _$loadListDataAsyncAction.run(() => super.loadListData());
  }

  late final _$onPreviousPageAsyncAction =
      AsyncAction('_PaginationBase.onPreviousPage', context: context);

  @override
  Future<void> onPreviousPage() {
    return _$onPreviousPageAsyncAction.run(() => super.onPreviousPage());
  }

  late final _$onNextPageAsyncAction =
      AsyncAction('_PaginationBase.onNextPage', context: context);

  @override
  Future<void> onNextPage() {
    return _$onNextPageAsyncAction.run(() => super.onNextPage());
  }

  @override
  String toString() {
    return '''
posts: ${posts},
isLoading: ${isLoading},
firstItemIndex: ${firstItemIndex},
lastItemIndex: ${lastItemIndex}
    ''';
  }
}
