// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedController on _FeedController, Store {
  final _$listAtom = Atom(name: '_FeedController.list');

  @override
  MovieList get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(MovieList value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$detailsAtom = Atom(name: '_FeedController.details');

  @override
  MovieDetail get details {
    _$detailsAtom.reportRead();
    return super.details;
  }

  @override
  set details(MovieDetail value) {
    _$detailsAtom.reportWrite(value, super.details, () {
      super.details = value;
    });
  }

  final _$getMovieDetailAsyncAction =
      AsyncAction('_FeedController.getMovieDetail');

  @override
  Future getMovieDetail(int id) {
    return _$getMovieDetailAsyncAction.run(() => super.getMovieDetail(id));
  }

  final _$getMovieListAsyncAction = AsyncAction('_FeedController.getMovieList');

  @override
  Future getMovieList() {
    return _$getMovieListAsyncAction.run(() => super.getMovieList());
  }

  @override
  String toString() {
    return '''
list: ${list},
details: ${details}
    ''';
  }
}
