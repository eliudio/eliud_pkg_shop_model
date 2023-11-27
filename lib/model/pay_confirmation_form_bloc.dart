/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_confirmation_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_pkg_shop_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop_model/model/model_export.dart';

import 'package:eliud_pkg_shop_model/model/pay_confirmation_form_event.dart';
import 'package:eliud_pkg_shop_model/model/pay_confirmation_form_state.dart';

class PayConfirmationFormBloc
    extends Bloc<PayConfirmationFormEvent, PayConfirmationFormState> {
  final FormAction? formAction;
  final String? appId;

  PayConfirmationFormBloc(this.appId, {this.formAction})
      : super(PayConfirmationFormUninitialized()) {
    on<InitialiseNewPayConfirmationFormEvent>((event, emit) {
      PayConfirmationFormLoaded loaded = PayConfirmationFormLoaded(
          value: PayConfirmationModel(
        documentID: "",
        appId: "",
        description: "",
      ));
      emit(loaded);
    });

    on<InitialisePayConfirmationFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      PayConfirmationFormLoaded loaded = PayConfirmationFormLoaded(
          value: await payConfirmationRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialisePayConfirmationFormNoLoadEvent>((event, emit) async {
      PayConfirmationFormLoaded loaded =
          PayConfirmationFormLoaded(value: event.value);
      emit(loaded);
    });
    PayConfirmationModel? newValue;
    on<ChangedPayConfirmationDocumentID>((event, emit) async {
      if (state is PayConfirmationFormInitialized) {
        final currentState = state as PayConfirmationFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittablePayConfirmationForm(value: newValue));
        }
      }
    });
    on<ChangedPayConfirmationDescription>((event, emit) async {
      if (state is PayConfirmationFormInitialized) {
        final currentState = state as PayConfirmationFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittablePayConfirmationForm(value: newValue));
      }
    });
    on<ChangedPayConfirmationShop>((event, emit) async {
      if (state is PayConfirmationFormInitialized) {
        final currentState = state as PayConfirmationFormInitialized;
        if (event.value != null) {
          newValue = currentState.value!.copyWith(
              shop: await shopRepository(appId: appId)!.get(event.value));
        }
        emit(SubmittablePayConfirmationForm(value: newValue));
      }
    });
    on<ChangedPayConfirmationBackToShopAction>((event, emit) async {
      if (state is PayConfirmationFormInitialized) {
        final currentState = state as PayConfirmationFormInitialized;
        newValue = currentState.value!.copyWith(backToShopAction: event.value);
        emit(SubmittablePayConfirmationForm(value: newValue));
      }
    });
    on<ChangedPayConfirmationConditions>((event, emit) async {
      if (state is PayConfirmationFormInitialized) {
        final currentState = state as PayConfirmationFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittablePayConfirmationForm(value: newValue));
      }
    });
  }

  DocumentIDPayConfirmationFormError error(
          String message, PayConfirmationModel newValue) =>
      DocumentIDPayConfirmationFormError(message: message, value: newValue);

  Future<PayConfirmationFormState> _isDocumentIDValid(
      String? value, PayConfirmationModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<PayConfirmationModel?> findDocument =
        payConfirmationRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittablePayConfirmationForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
