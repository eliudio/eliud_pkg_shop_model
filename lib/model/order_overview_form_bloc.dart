/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_overview_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_pkg_shop_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop_model/model/model_export.dart';

import 'package:eliud_pkg_shop_model/model/order_overview_form_event.dart';
import 'package:eliud_pkg_shop_model/model/order_overview_form_state.dart';

class OrderOverviewFormBloc
    extends Bloc<OrderOverviewFormEvent, OrderOverviewFormState> {
  final FormAction? formAction;
  final String? appId;

  OrderOverviewFormBloc(this.appId, {this.formAction})
      : super(OrderOverviewFormUninitialized()) {
    on<InitialiseNewOrderOverviewFormEvent>((event, emit) {
      OrderOverviewFormLoaded loaded = OrderOverviewFormLoaded(
          value: OrderOverviewModel(
        documentID: "",
        appId: "",
        description: "",
      ));
      emit(loaded);
    });

    on<InitialiseOrderOverviewFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      OrderOverviewFormLoaded loaded = OrderOverviewFormLoaded(
          value: await orderOverviewRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseOrderOverviewFormNoLoadEvent>((event, emit) async {
      OrderOverviewFormLoaded loaded =
          OrderOverviewFormLoaded(value: event.value);
      emit(loaded);
    });
    OrderOverviewModel? newValue;
    on<ChangedOrderOverviewDocumentID>((event, emit) async {
      if (state is OrderOverviewFormInitialized) {
        final currentState = state as OrderOverviewFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableOrderOverviewForm(value: newValue));
        }
      }
    });
    on<ChangedOrderOverviewDescription>((event, emit) async {
      if (state is OrderOverviewFormInitialized) {
        final currentState = state as OrderOverviewFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableOrderOverviewForm(value: newValue));
      }
    });
    on<ChangedOrderOverviewShop>((event, emit) async {
      if (state is OrderOverviewFormInitialized) {
        final currentState = state as OrderOverviewFormInitialized;
        if (event.value != null) {
          newValue = currentState.value!.copyWith(
              shop: await shopRepository(appId: appId)!.get(event.value));
        }
        emit(SubmittableOrderOverviewForm(value: newValue));
      }
    });
    on<ChangedOrderOverviewItemImageBackground>((event, emit) async {
      if (state is OrderOverviewFormInitialized) {
        final currentState = state as OrderOverviewFormInitialized;
        newValue =
            currentState.value!.copyWith(itemImageBackground: event.value);
        emit(SubmittableOrderOverviewForm(value: newValue));
      }
    });
    on<ChangedOrderOverviewItemDetailBackground>((event, emit) async {
      if (state is OrderOverviewFormInitialized) {
        final currentState = state as OrderOverviewFormInitialized;
        newValue =
            currentState.value!.copyWith(itemDetailBackground: event.value);
        emit(SubmittableOrderOverviewForm(value: newValue));
      }
    });
    on<ChangedOrderOverviewConditions>((event, emit) async {
      if (state is OrderOverviewFormInitialized) {
        final currentState = state as OrderOverviewFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableOrderOverviewForm(value: newValue));
      }
    });
  }

  DocumentIDOrderOverviewFormError error(
          String message, OrderOverviewModel newValue) =>
      DocumentIDOrderOverviewFormError(message: message, value: newValue);

  Future<OrderOverviewFormState> _isDocumentIDValid(
      String? value, OrderOverviewModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<OrderOverviewModel?> findDocument =
        orderOverviewRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableOrderOverviewForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
