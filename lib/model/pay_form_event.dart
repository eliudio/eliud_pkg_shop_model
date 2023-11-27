/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core_main/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop_model/model/model_export.dart';

@immutable
abstract class PayFormEvent extends Equatable {
  const PayFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewPayFormEvent extends PayFormEvent {}

class InitialisePayFormEvent extends PayFormEvent {
  final PayModel? value;

  @override
  List<Object?> get props => [value];

  InitialisePayFormEvent({this.value});
}

class InitialisePayFormNoLoadEvent extends PayFormEvent {
  final PayModel? value;

  @override
  List<Object?> get props => [value];

  InitialisePayFormNoLoadEvent({this.value});
}

class ChangedPayDocumentID extends PayFormEvent {
  final String? value;

  ChangedPayDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPayDocumentID{ value: $value }';
}

class ChangedPayAppId extends PayFormEvent {
  final String? value;

  ChangedPayAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPayAppId{ value: $value }';
}

class ChangedPayDescription extends PayFormEvent {
  final String? value;

  ChangedPayDescription({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPayDescription{ value: $value }';
}

class ChangedPaySucceeded extends PayFormEvent {
  final ActionModel? value;

  ChangedPaySucceeded({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPaySucceeded{ value: $value }';
}

class ChangedPayPayAction extends PayFormEvent {
  final ActionModel? value;

  ChangedPayPayAction({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPayPayAction{ value: $value }';
}

class ChangedPayShop extends PayFormEvent {
  final String? value;

  ChangedPayShop({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPayShop{ value: $value }';
}

class ChangedPayConditions extends PayFormEvent {
  final StorageConditionsModel? value;

  ChangedPayConditions({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPayConditions{ value: $value }';
}
