import 'dart:convert';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:reddit_modular/app/features/home/home_controller.dart';
import 'package:reddit_modular/app/features/pagination/pagination_controller.dart';
import 'package:reddit_modular/app/service/reddit_service.dart';
import 'package:reddit_modular/app/shared/models/post_model.dart';

import 'home_controller_test.mocks.dart';

@GenerateMocks([PaginationController, HomeController, RedditService])
void main() {
  MockHomeController? controller;
  MockPaginationController? paginationController;
  MockRedditService? service;

  setUp(() {
    controller = MockHomeController();
    service = MockRedditService();
    paginationController = MockPaginationController();
  });

  List<dynamic> posts = [
    Post(
      subreddit: 'r/androiddev',
      id: '123',
      author: 'author',
      title: 'title',
      imagePath: 'imagePath',
      thumbnailPath: 'thumbnailPath',
      upvotes: '4',
    ),
    Post(
      subreddit: 'r/androiddev',
      id: '123',
      author: 'author',
      title: 'title',
      imagePath: 'imagePath',
      thumbnailPath: 'thumbnailPath',
      upvotes: '4',
    ),
    Post(
      subreddit: 'r/androiddev',
      id: '123',
      author: 'author',
      title: 'title',
      imagePath: 'imagePath',
      thumbnailPath: 'thumbnailPath',
      upvotes: '4',
    ),
    Post(
      subreddit: 'r/androiddev',
      id: '123',
      author: 'author',
      title: 'title',
      imagePath: 'imagePath',
      thumbnailPath: 'thumbnailPath',
      upvotes: '4',
    ),
  ];

  group('HomeController Tests', () {
    test('controller is being instantiate correct', () {
      expect(controller, isInstanceOf<HomeController>());
    });

    test('should be load list of posts from service', () async {
      when(service!.getContent('')).thenThrow(Exception());

      when(await controller!.searchTerm(any))
          .thenAnswer((_) => Future.value(posts));

      expect(await controller!.searchTerm(''), posts);

      // when(controller!.posts).thenReturn(posts);

      // expect(controller!.posts, posts);
    });

    test('should be change isLoading state', () {
      when(controller!.isLoading).thenReturn(true);
      expect(controller!.isLoading, true);

      when(controller!.isLoading).thenReturn(false);
      expect(controller!.isLoading, false);
    });

    test('should be return a filters list', () {
      when(controller!.filters).thenReturn([]);

      expect(controller!.filters, []);
    });
  });

  group('PaginationController Tests...', () {
    test('should be load initial data', () async {
      when(paginationController!.loadInitialData()).thenReturn(true);

      expect(
        paginationController!.loadInitialData(),
        true,
      );
    });
  });
}
