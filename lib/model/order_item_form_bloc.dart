/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_item_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:bloc/bloc.dart';

import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_pkg_shop_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop_model/model/model_export.dart';

import 'package:eliud_pkg_shop_model/model/order_item_form_event.dart';
import 'package:eliud_pkg_shop_model/model/order_item_form_state.dart';

class OrderItemFormBloc extends Bloc<OrderItemFormEvent, OrderItemFormState> {
  final String? appId;

  OrderItemFormBloc(
    this.appId,
  ) : super(OrderItemFormUninitialized()) {
    on<InitialiseNewOrderItemFormEvent>((event, emit) {
      OrderItemFormLoaded loaded = OrderItemFormLoaded(
          value: OrderItemModel(
        documentID: "IDENTIFIER",
        amount: 0,
        appId: "",
        soldPrice: 0.0,
      ));
      emit(loaded);
    });

    on<InitialiseOrderItemFormEvent>((event, emit) async {
      OrderItemFormLoaded loaded = OrderItemFormLoaded(value: event.value);
      emit(loaded);
    });
    on<InitialiseOrderItemFormNoLoadEvent>((event, emit) async {
      OrderItemFormLoaded loaded = OrderItemFormLoaded(value: event.value);
      emit(loaded);
    });
    OrderItemModel? newValue;
    on<ChangedOrderItemAmount>((event, emit) async {
      if (state is OrderItemFormInitialized) {
        final currentState = state as OrderItemFormInitialized;
        if (isInt(event.value)) {
          newValue =
              currentState.value!.copyWith(amount: int.parse(event.value!));
          emit(SubmittableOrderItemForm(value: newValue));
        } else {
          newValue = currentState.value!.copyWith(amount: 0);
          emit(AmountOrderItemFormError(
              message: "Value should be a number", value: newValue));
        }
      }
    });
    on<ChangedOrderItemAppId>((event, emit) async {
      if (state is OrderItemFormInitialized) {
        final currentState = state as OrderItemFormInitialized;
        newValue = currentState.value!.copyWith(appId: event.value);
        emit(SubmittableOrderItemForm(value: newValue));
      }
    });
    on<ChangedOrderItemSoldPrice>((event, emit) async {
      if (state is OrderItemFormInitialized) {
        final currentState = state as OrderItemFormInitialized;
        if (isDouble(event.value!)) {
          newValue = currentState.value!
              .copyWith(soldPrice: double.parse(event.value!));
          emit(SubmittableOrderItemForm(value: newValue));
        } else {
          newValue = currentState.value!.copyWith(soldPrice: 0.0);
          emit(SoldPriceOrderItemFormError(
              message: "Value should be a number or decimal number",
              value: newValue));
        }
      }
    });
    on<ChangedOrderItemProduct>((event, emit) async {
      if (state is OrderItemFormInitialized) {
        final currentState = state as OrderItemFormInitialized;
        if (event.value != null) {
          newValue = currentState.value!.copyWith(
              product: await productRepository(appId: appId)!.get(event.value));
        }
        emit(SubmittableOrderItemForm(value: newValue));
      }
    });
  }
}
