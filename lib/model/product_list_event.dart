/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_shop_model/model/product_model.dart';

abstract class ProductListEvent extends Equatable {
  const ProductListEvent();
  @override
  List<Object?> get props => [];
}

class LoadProductList extends ProductListEvent {}

class NewPage extends ProductListEvent {}

class AddProductList extends ProductListEvent {
  final ProductModel? value;

  const AddProductList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddProductList{ value: $value }';
}

class UpdateProductList extends ProductListEvent {
  final ProductModel? value;

  const UpdateProductList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdateProductList{ value: $value }';
}

class DeleteProductList extends ProductListEvent {
  final ProductModel? value;

  const DeleteProductList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeleteProductList{ value: $value }';
}

class ProductListUpdated extends ProductListEvent {
  final List<ProductModel?>? value;
  final bool? mightHaveMore;

  const ProductListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'ProductListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class ProductChangeQuery extends ProductListEvent {
  final EliudQuery? newQuery;

  const ProductChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'ProductChangeQuery{ value: $newQuery }';
}
