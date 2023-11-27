/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_front_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core_main/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop_model/model/model_export.dart';

@immutable
abstract class ShopFrontFormEvent extends Equatable {
  const ShopFrontFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewShopFrontFormEvent extends ShopFrontFormEvent {}

class InitialiseShopFrontFormEvent extends ShopFrontFormEvent {
  final ShopFrontModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseShopFrontFormEvent({this.value});
}

class InitialiseShopFrontFormNoLoadEvent extends ShopFrontFormEvent {
  final ShopFrontModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseShopFrontFormNoLoadEvent({this.value});
}

class ChangedShopFrontDocumentID extends ShopFrontFormEvent {
  final String? value;

  ChangedShopFrontDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedShopFrontDocumentID{ value: $value }';
}

class ChangedShopFrontAppId extends ShopFrontFormEvent {
  final String? value;

  ChangedShopFrontAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedShopFrontAppId{ value: $value }';
}

class ChangedShopFrontTitle extends ShopFrontFormEvent {
  final String? value;

  ChangedShopFrontTitle({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedShopFrontTitle{ value: $value }';
}

class ChangedShopFrontDescription extends ShopFrontFormEvent {
  final String? value;

  ChangedShopFrontDescription({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedShopFrontDescription{ value: $value }';
}

class ChangedShopFrontShop extends ShopFrontFormEvent {
  final String? value;

  ChangedShopFrontShop({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedShopFrontShop{ value: $value }';
}

class ChangedShopFrontSize extends ShopFrontFormEvent {
  final String? value;

  ChangedShopFrontSize({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedShopFrontSize{ value: $value }';
}

class ChangedShopFrontCardElevation extends ShopFrontFormEvent {
  final String? value;

  ChangedShopFrontCardElevation({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedShopFrontCardElevation{ value: $value }';
}

class ChangedShopFrontCardAxisSpacing extends ShopFrontFormEvent {
  final String? value;

  ChangedShopFrontCardAxisSpacing({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedShopFrontCardAxisSpacing{ value: $value }';
}

class ChangedShopFrontItemCardBackground extends ShopFrontFormEvent {
  final BackgroundModel? value;

  ChangedShopFrontItemCardBackground({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedShopFrontItemCardBackground{ value: $value }';
}

class ChangedShopFrontAddToCartColor extends ShopFrontFormEvent {
  final RgbModel? value;

  ChangedShopFrontAddToCartColor({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedShopFrontAddToCartColor{ value: $value }';
}

class ChangedShopFrontScrollDirection extends ShopFrontFormEvent {
  final ScrollDirection? value;

  ChangedShopFrontScrollDirection({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedShopFrontScrollDirection{ value: $value }';
}

class ChangedShopFrontBuyAction extends ShopFrontFormEvent {
  final ActionModel? value;

  ChangedShopFrontBuyAction({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedShopFrontBuyAction{ value: $value }';
}

class ChangedShopFrontOpenProductAction extends ShopFrontFormEvent {
  final ActionModel? value;

  ChangedShopFrontOpenProductAction({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedShopFrontOpenProductAction{ value: $value }';
}

class ChangedShopFrontPadding extends ShopFrontFormEvent {
  final EdgeInsetsGeometryModel? value;

  ChangedShopFrontPadding({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedShopFrontPadding{ value: $value }';
}

class ChangedShopFrontConditions extends ShopFrontFormEvent {
  final StorageConditionsModel? value;

  ChangedShopFrontConditions({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedShopFrontConditions{ value: $value }';
}
