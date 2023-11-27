/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_pkg_shop_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop_model/model/model_export.dart';

import 'package:eliud_pkg_shop_model/model/shop_form_event.dart';
import 'package:eliud_pkg_shop_model/model/shop_form_state.dart';

class ShopFormBloc extends Bloc<ShopFormEvent, ShopFormState> {
  final FormAction? formAction;
  final String? appId;

  ShopFormBloc(this.appId, {this.formAction}) : super(ShopFormUninitialized()) {
    on<InitialiseNewShopFormEvent>((event, emit) {
      ShopFormLoaded loaded = ShopFormLoaded(
          value: ShopModel(
        documentID: "",
        appId: "",
        description: "",
        shortDescription: "",
        currency: "",
      ));
      emit(loaded);
    });

    on<InitialiseShopFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      ShopFormLoaded loaded = ShopFormLoaded(
          value:
              await shopRepository(appId: appId)!.get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseShopFormNoLoadEvent>((event, emit) async {
      ShopFormLoaded loaded = ShopFormLoaded(value: event.value);
      emit(loaded);
    });
    ShopModel? newValue;
    on<ChangedShopDocumentID>((event, emit) async {
      if (state is ShopFormInitialized) {
        final currentState = state as ShopFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableShopForm(value: newValue));
        }
      }
    });
    on<ChangedShopDescription>((event, emit) async {
      if (state is ShopFormInitialized) {
        final currentState = state as ShopFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableShopForm(value: newValue));
      }
    });
    on<ChangedShopShortDescription>((event, emit) async {
      if (state is ShopFormInitialized) {
        final currentState = state as ShopFormInitialized;
        newValue = currentState.value!.copyWith(shortDescription: event.value);
        emit(SubmittableShopForm(value: newValue));
      }
    });
    on<ChangedShopCurrency>((event, emit) async {
      if (state is ShopFormInitialized) {
        final currentState = state as ShopFormInitialized;
        newValue = currentState.value!.copyWith(currency: event.value);
        emit(SubmittableShopForm(value: newValue));
      }
    });
    on<ChangedShopConditions>((event, emit) async {
      if (state is ShopFormInitialized) {
        final currentState = state as ShopFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableShopForm(value: newValue));
      }
    });
  }

  DocumentIDShopFormError error(String message, ShopModel newValue) =>
      DocumentIDShopFormError(message: message, value: newValue);

  Future<ShopFormState> _isDocumentIDValid(
      String? value, ShopModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<ShopModel?> findDocument = shopRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableShopForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
