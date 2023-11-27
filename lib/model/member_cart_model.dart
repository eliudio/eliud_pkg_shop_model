/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_cart_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_pkg_shop_model/model/model_export.dart';
import 'package:eliud_pkg_shop_model/model/entity_export.dart';

import 'package:eliud_pkg_shop_model/model/member_cart_entity.dart';

class MemberCartModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_shop_model';
  static const String id = 'memberCarts';

  @override
  String documentID;
  @override
  String appId;
  List<CartItemModel>? cartItems;

  MemberCartModel({
    required this.documentID,
    required this.appId,
    this.cartItems,
  });

  @override
  MemberCartModel copyWith({
    String? documentID,
    String? appId,
    List<CartItemModel>? cartItems,
  }) {
    return MemberCartModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      cartItems: cartItems ?? this.cartItems,
    );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ cartItems.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberCartModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          ListEquality().equals(cartItems, other.cartItems);

  @override
  String toString() {
    String cartItemsCsv = (cartItems == null) ? '' : cartItems!.join(', ');

    return 'MemberCartModel{documentID: $documentID, appId: $appId, cartItems: CartItem[] { $cartItemsCsv }}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (cartItems != null) {
      for (var item in cartItems!) {
        referencesCollector.addAll(await item.collectReferences(appId: appId));
      }
    }
    return referencesCollector;
  }

  @override
  MemberCartEntity toEntity({String? appId}) {
    return MemberCartEntity(
      appId: appId,
      cartItems: (cartItems != null)
          ? cartItems!.map((item) => item.toEntity(appId: appId)).toList()
          : null,
    );
  }

  static Future<MemberCartModel?> fromEntity(
      String documentID, MemberCartEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return MemberCartModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      cartItems: entity.cartItems == null
          ? null
          : List<CartItemModel>.from(
              await Future.wait(entity.cartItems!.map((item) {
              counter++;
              return CartItemModel.fromEntity(counter.toString(), item);
            }).toList())),
    );
  }

  static Future<MemberCartModel?> fromEntityPlus(
      String documentID, MemberCartEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return MemberCartModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      cartItems: entity.cartItems == null
          ? null
          : List<CartItemModel>.from(
              await Future.wait(entity.cartItems!.map((item) {
              counter++;
              return CartItemModel.fromEntityPlus(counter.toString(), item,
                  appId: appId);
            }).toList())),
    );
  }
}
