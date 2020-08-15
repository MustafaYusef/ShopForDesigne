import 'dart:io';

import 'package:Shope_desgine/models/categoryModel.dart';
import 'package:Shope_desgine/repastory/repastory.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter/cupertino.dart';

import 'package:rxdart/rxdart.dart';

abstract class CategoryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAllCategory extends CategoryEvent {
  int p;
  bool flage;

  FetchAllCategory({this.p, this.flage});

  @override
  List<Object> get props => [p, flage];
}

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryUninitialized extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryError extends CategoryState {
  final string;
  CategoryError(this.string);
}

class CategoryNetworkError extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final CategoryModel allCatgory;

  CategoryLoaded({this.allCatgory});

  @override
  List<Object> get props => [allCatgory];
}

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final Repastory Repo;

  CategoryBloc({@required this.Repo}) : super(CategoryUninitialized());

  @override
  Stream<Transition<CategoryEvent, CategoryState>> transformEvents(
    Stream<CategoryEvent> events,
    TransitionFunction<CategoryEvent, CategoryState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    final currentState = state;

    if (event is FetchAllCategory) {
      print("bloc pressed");
      try {
        yield (CategoryUninitialized());
        final posts = await Repo.getCategory();
        yield CategoryLoaded(
          allCatgory: posts,
        );
        return;
      } on SocketException catch (_) {
        yield CategoryNetworkError();
      } catch (_) {
        yield CategoryError(_.toString());
      }
    }
  }
}
