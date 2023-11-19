/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_references_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_pkg_shop_model/model/entity_export.dart';

import 'package:eliud_pkg_shop_model/model/order_references_entity.dart';

class OrderReferencesModel {
  static const String packageName = 'eliud_pkg_shop_model';
  static const String id = 'orderReferencess';

  String? paymentReference;
  String? shipmentReference;
  String? deliveryReference;

  OrderReferencesModel({
    this.paymentReference,
    this.shipmentReference,
    this.deliveryReference,
  });

  OrderReferencesModel copyWith({
    String? paymentReference,
    String? shipmentReference,
    String? deliveryReference,
  }) {
    return OrderReferencesModel(
      paymentReference: paymentReference ?? this.paymentReference,
      shipmentReference: shipmentReference ?? this.shipmentReference,
      deliveryReference: deliveryReference ?? this.deliveryReference,
    );
  }

  @override
  int get hashCode =>
      paymentReference.hashCode ^
      shipmentReference.hashCode ^
      deliveryReference.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderReferencesModel &&
          runtimeType == other.runtimeType &&
          paymentReference == other.paymentReference &&
          shipmentReference == other.shipmentReference &&
          deliveryReference == other.deliveryReference;

  @override
  String toString() {
    return 'OrderReferencesModel{paymentReference: $paymentReference, shipmentReference: $shipmentReference, deliveryReference: $deliveryReference}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    return referencesCollector;
  }

  OrderReferencesEntity toEntity({String? appId}) {
    return OrderReferencesEntity(
      paymentReference: (paymentReference != null) ? paymentReference : null,
      shipmentReference: (shipmentReference != null) ? shipmentReference : null,
      deliveryReference: (deliveryReference != null) ? deliveryReference : null,
    );
  }

  static Future<OrderReferencesModel?> fromEntity(
      OrderReferencesEntity? entity) async {
    if (entity == null) return null;
    return OrderReferencesModel(
      paymentReference: entity.paymentReference,
      shipmentReference: entity.shipmentReference,
      deliveryReference: entity.deliveryReference,
    );
  }

  static Future<OrderReferencesModel?> fromEntityPlus(
      OrderReferencesEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return OrderReferencesModel(
      paymentReference: entity.paymentReference,
      shipmentReference: entity.shipmentReference,
      deliveryReference: entity.deliveryReference,
    );
  }
}
