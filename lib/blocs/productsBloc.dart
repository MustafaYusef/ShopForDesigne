import 'dart:io';

import 'package:Shope_desgine/models/productsModel.dart';
import 'package:Shope_desgine/repastory/repastory.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter/cupertino.dart';

import 'package:rxdart/rxdart.dart';

abstract class ProductsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAllProducts extends ProductsEvent {}

class FetchProductsByCategory extends ProductsEvent {
  final id;

  FetchProductsByCategory({this.id});

  @override
  List<Object> get props => [id];
}

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsUninitialized extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsError extends ProductsState {
  final string;
  ProductsError(this.string);
}

class ProductsNetworkError extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final ProductsModel allProducts;

  ProductsLoaded({this.allProducts});

  @override
  List<Object> get props => [allProducts];
}

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final Repastory Repo;

  ProductsBloc({@required this.Repo}) : super(ProductsUninitialized());

  @override
  Stream<Transition<ProductsEvent, ProductsState>> transformEvents(
    Stream<ProductsEvent> events,
    TransitionFunction<ProductsEvent, ProductsState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    final currentState = state;

    if (event is FetchAllProducts || event is FetchProductsByCategory) {
      print("bloc pressed");
      try {
        if (event is FetchProductsByCategory) {
          yield (ProductsUninitialized());
          final posts = await Repo.getProductByCategory(event.id);
          yield ProductsLoaded(allProducts: posts);
        } else {
          yield (ProductsUninitialized());
          final posts = await Repo.getProducts();
          yield ProductsLoaded(allProducts: posts);
        }

        return;
      } on SocketException catch (_) {
        yield ProductsNetworkError();
      } catch (_) {
        yield ProductsError(_.toString());
      }
    }
  }
}
