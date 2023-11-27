/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_item_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_pkg_shop_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop_model/model/model_export.dart';
import 'package:eliud_pkg_shop_model/model/entity_export.dart';

import 'package:eliud_pkg_shop_model/model/order_item_entity.dart';

class OrderItemModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_shop_model';
  static const String id = 'orderItems';

  @override
  String documentID;
  int? amount;
  @override
  String appId;
  double? soldPrice;
  ProductModel? product;

  OrderItemModel({
    required this.documentID,
    this.amount,
    required this.appId,
    this.soldPrice,
    this.product,
  });

  @override
  OrderItemModel copyWith({
    String? documentID,
    int? amount,
    String? appId,
    double? soldPrice,
    ProductModel? product,
  }) {
    return OrderItemModel(
      documentID: documentID ?? this.documentID,
      amount: amount ?? this.amount,
      appId: appId ?? this.appId,
      soldPrice: soldPrice ?? this.soldPrice,
      product: product ?? this.product,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      amount.hashCode ^
      appId.hashCode ^
      soldPrice.hashCode ^
      product.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderItemModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          amount == other.amount &&
          appId == other.appId &&
          soldPrice == other.soldPrice &&
          product == other.product;

  @override
  String toString() {
    return 'OrderItemModel{documentID: $documentID, amount: $amount, appId: $appId, soldPrice: $soldPrice, product: $product}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (product != null) {
      referencesCollector.add(
          ModelReference(ProductModel.packageName, ProductModel.id, product!));
    }
    if (product != null) {
      referencesCollector
          .addAll(await product!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  OrderItemEntity toEntity({String? appId}) {
    return OrderItemEntity(
      amount: (amount != null) ? amount : null,
      appId: appId,
      soldPrice: (soldPrice != null) ? soldPrice : null,
      productId: (product != null) ? product!.documentID : null,
    );
  }

  static Future<OrderItemModel?> fromEntity(
      String documentID, OrderItemEntity? entity) async {
    if (entity == null) return null;
    return OrderItemModel(
      documentID: documentID,
      amount: entity.amount,
      appId: entity.appId ?? '',
      soldPrice: entity.soldPrice,
    );
  }

  static Future<OrderItemModel?> fromEntityPlus(
      String documentID, OrderItemEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    ProductModel? productHolder;
    if (entity.productId != null) {
      try {
        productHolder =
            await productRepository(appId: appId)!.get(entity.productId);
      } on Exception catch (e) {
        print('Error whilst trying to initialise product');
        print('Error whilst retrieving product with id ${entity.productId}');
        print('Exception: $e');
      }
    }

    return OrderItemModel(
      documentID: documentID,
      amount: entity.amount,
      appId: entity.appId ?? '',
      soldPrice: entity.soldPrice,
      product: productHolder,
    );
  }
}
