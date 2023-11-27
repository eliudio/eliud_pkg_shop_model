/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_overview_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_shop_model/model/model_export.dart';

@immutable
abstract class OrderOverviewFormEvent extends Equatable {
  const OrderOverviewFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewOrderOverviewFormEvent extends OrderOverviewFormEvent {}

class InitialiseOrderOverviewFormEvent extends OrderOverviewFormEvent {
  final OrderOverviewModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseOrderOverviewFormEvent({this.value});
}

class InitialiseOrderOverviewFormNoLoadEvent extends OrderOverviewFormEvent {
  final OrderOverviewModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseOrderOverviewFormNoLoadEvent({this.value});
}

class ChangedOrderOverviewDocumentID extends OrderOverviewFormEvent {
  final String? value;

  ChangedOrderOverviewDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedOrderOverviewDocumentID{ value: $value }';
}

class ChangedOrderOverviewAppId extends OrderOverviewFormEvent {
  final String? value;

  ChangedOrderOverviewAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedOrderOverviewAppId{ value: $value }';
}

class ChangedOrderOverviewDescription extends OrderOverviewFormEvent {
  final String? value;

  ChangedOrderOverviewDescription({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedOrderOverviewDescription{ value: $value }';
}

class ChangedOrderOverviewShop extends OrderOverviewFormEvent {
  final String? value;

  ChangedOrderOverviewShop({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedOrderOverviewShop{ value: $value }';
}

class ChangedOrderOverviewItemImageBackground extends OrderOverviewFormEvent {
  final BackgroundModel? value;

  ChangedOrderOverviewItemImageBackground({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() =>
      'ChangedOrderOverviewItemImageBackground{ value: $value }';
}

class ChangedOrderOverviewItemDetailBackground extends OrderOverviewFormEvent {
  final BackgroundModel? value;

  ChangedOrderOverviewItemDetailBackground({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() =>
      'ChangedOrderOverviewItemDetailBackground{ value: $value }';
}

class ChangedOrderOverviewConditions extends OrderOverviewFormEvent {
  final StorageConditionsModel? value;

  ChangedOrderOverviewConditions({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedOrderOverviewConditions{ value: $value }';
}
