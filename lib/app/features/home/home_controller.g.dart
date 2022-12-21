// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_HomeBase.isLoading', context: context);

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

  late final _$reverseListAtom =
      Atom(name: '_HomeBase.reverseList', context: context);

  @override
  bool get reverseList {
    _$reverseListAtom.reportRead();
    return super.reverseList;
  }

  @override
  set reverseList(bool value) {
    _$reverseListAtom.reportWrite(value, super.reverseList, () {
      super.reverseList = value;
    });
  }

  late final _$postsAtom = Atom(name: '_HomeBase.posts', context: context);

  @override
  List<Post> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(List<Post> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  late final _$_responseAtom =
      Atom(name: '_HomeBase._response', context: context);

  @override
  List<dynamic> get _response {
    _$_responseAtom.reportRead();
    return super._response;
  }

  @override
  set _response(List<dynamic> value) {
    _$_responseAtom.reportWrite(value, super._response, () {
      super._response = value;
    });
  }

  late final _$filtersAtom = Atom(name: '_HomeBase.filters', context: context);

  @override
  List<Filter> get filters {
    _$filtersAtom.reportRead();
    return super.filters;
  }

  @override
  set filters(List<Filter> value) {
    _$filtersAtom.reportWrite(value, super.filters, () {
      super.filters = value;
    });
  }

  late final _$searchTermAsyncAction =
      AsyncAction('_HomeBase.searchTerm', context: context);

  @override
  Future<void> searchTerm(String term) {
    return _$searchTermAsyncAction.run(() => super.searchTerm(term));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
reverseList: ${reverseList},
posts: ${posts},
filters: ${filters}
    ''';
  }
}
