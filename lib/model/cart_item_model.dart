/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_item_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_pkg_shop_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop_model/model/model_export.dart';
import 'package:eliud_pkg_shop_model/model/entity_export.dart';

import 'package:eliud_pkg_shop_model/model/cart_item_entity.dart';

class CartItemModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_shop_model';
  static const String id = 'cartItems';

  @override
  String documentID;
  int? amount;
  @override
  String appId;
  ProductModel? product;

  CartItemModel({
    required this.documentID,
    this.amount,
    required this.appId,
    this.product,
  });

  @override
  CartItemModel copyWith({
    String? documentID,
    int? amount,
    String? appId,
    ProductModel? product,
  }) {
    return CartItemModel(
      documentID: documentID ?? this.documentID,
      amount: amount ?? this.amount,
      appId: appId ?? this.appId,
      product: product ?? this.product,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^ amount.hashCode ^ appId.hashCode ^ product.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItemModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          amount == other.amount &&
          appId == other.appId &&
          product == other.product;

  @override
  String toString() {
    return 'CartItemModel{documentID: $documentID, amount: $amount, appId: $appId, product: $product}';
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
  CartItemEntity toEntity({String? appId}) {
    return CartItemEntity(
      amount: (amount != null) ? amount : null,
      appId: appId,
      productId: (product != null) ? product!.documentID : null,
    );
  }

  static Future<CartItemModel?> fromEntity(
      String documentID, CartItemEntity? entity) async {
    if (entity == null) return null;
    return CartItemModel(
      documentID: documentID,
      amount: entity.amount,
      appId: entity.appId ?? '',
    );
  }

  static Future<CartItemModel?> fromEntityPlus(
      String documentID, CartItemEntity? entity,
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

    return CartItemModel(
      documentID: documentID,
      amount: entity.amount,
      appId: entity.appId ?? '',
      product: productHolder,
    );
  }
}
