/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_image_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_pkg_shop_model/model/model_export.dart';

@immutable
abstract class ProductImageFormEvent extends Equatable {
  const ProductImageFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewProductImageFormEvent extends ProductImageFormEvent {}

class InitialiseProductImageFormEvent extends ProductImageFormEvent {
  final ProductImageModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseProductImageFormEvent({this.value});
}

class InitialiseProductImageFormNoLoadEvent extends ProductImageFormEvent {
  final ProductImageModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseProductImageFormNoLoadEvent({this.value});
}

class ChangedProductImageDocumentID extends ProductImageFormEvent {
  final String? value;

  ChangedProductImageDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedProductImageDocumentID{ value: $value }';
}

class ChangedProductImageImage extends ProductImageFormEvent {
  final String? value;

  ChangedProductImageImage({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedProductImageImage{ value: $value }';
}
