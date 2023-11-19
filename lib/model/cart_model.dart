/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_pkg_shop_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop_model/model/model_export.dart';
import 'package:eliud_pkg_shop_model/model/entity_export.dart';

import 'package:eliud_pkg_shop_model/model/cart_entity.dart';

class CartModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_shop_model';
  static const String id = 'carts';

  @override
  String documentID;
  @override
  String appId;
  String? title;
  String? description;
  String? checkoutText;
  ShopModel? shop;
  BackgroundModel? itemImageBackground;
  BackgroundModel? itemDetailBackground;
  ActionModel? checkoutAction;
  ActionModel? backToShopAction;
  ActionModel? openProductAction;
  StorageConditionsModel? conditions;

  CartModel({
    required this.documentID,
    required this.appId,
    this.title,
    this.description,
    this.checkoutText,
    this.shop,
    this.itemImageBackground,
    this.itemDetailBackground,
    this.checkoutAction,
    this.backToShopAction,
    this.openProductAction,
    this.conditions,
  });

  @override
  CartModel copyWith({
    String? documentID,
    String? appId,
    String? title,
    String? description,
    String? checkoutText,
    ShopModel? shop,
    BackgroundModel? itemImageBackground,
    BackgroundModel? itemDetailBackground,
    ActionModel? checkoutAction,
    ActionModel? backToShopAction,
    ActionModel? openProductAction,
    StorageConditionsModel? conditions,
  }) {
    return CartModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      title: title ?? this.title,
      description: description ?? this.description,
      checkoutText: checkoutText ?? this.checkoutText,
      shop: shop ?? this.shop,
      itemImageBackground: itemImageBackground ?? this.itemImageBackground,
      itemDetailBackground: itemDetailBackground ?? this.itemDetailBackground,
      checkoutAction: checkoutAction ?? this.checkoutAction,
      backToShopAction: backToShopAction ?? this.backToShopAction,
      openProductAction: openProductAction ?? this.openProductAction,
      conditions: conditions ?? this.conditions,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      title.hashCode ^
      description.hashCode ^
      checkoutText.hashCode ^
      shop.hashCode ^
      itemImageBackground.hashCode ^
      itemDetailBackground.hashCode ^
      checkoutAction.hashCode ^
      backToShopAction.hashCode ^
      openProductAction.hashCode ^
      conditions.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          description == other.description &&
          checkoutText == other.checkoutText &&
          shop == other.shop &&
          itemImageBackground == other.itemImageBackground &&
          itemDetailBackground == other.itemDetailBackground &&
          checkoutAction == other.checkoutAction &&
          backToShopAction == other.backToShopAction &&
          openProductAction == other.openProductAction &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'CartModel{documentID: $documentID, appId: $appId, title: $title, description: $description, checkoutText: $checkoutText, shop: $shop, itemImageBackground: $itemImageBackground, itemDetailBackground: $itemDetailBackground, checkoutAction: $checkoutAction, backToShopAction: $backToShopAction, openProductAction: $openProductAction, conditions: $conditions}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (shop != null) {
      referencesCollector
          .add(ModelReference(ShopModel.packageName, ShopModel.id, shop!));
    }
    if (shop != null) {
      referencesCollector.addAll(await shop!.collectReferences(appId: appId));
    }
    if (itemImageBackground != null) {
      referencesCollector
          .addAll(await itemImageBackground!.collectReferences(appId: appId));
    }
    if (itemDetailBackground != null) {
      referencesCollector
          .addAll(await itemDetailBackground!.collectReferences(appId: appId));
    }
    if (checkoutAction != null) {
      referencesCollector
          .addAll(await checkoutAction!.collectReferences(appId: appId));
    }
    if (backToShopAction != null) {
      referencesCollector
          .addAll(await backToShopAction!.collectReferences(appId: appId));
    }
    if (openProductAction != null) {
      referencesCollector
          .addAll(await openProductAction!.collectReferences(appId: appId));
    }
    if (conditions != null) {
      referencesCollector
          .addAll(await conditions!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  CartEntity toEntity({String? appId}) {
    return CartEntity(
      appId: appId,
      title: (title != null) ? title : null,
      description: (description != null) ? description : null,
      checkoutText: (checkoutText != null) ? checkoutText : null,
      shopId: (shop != null) ? shop!.documentID : null,
      itemImageBackground: (itemImageBackground != null)
          ? itemImageBackground!.toEntity(appId: appId)
          : null,
      itemDetailBackground: (itemDetailBackground != null)
          ? itemDetailBackground!.toEntity(appId: appId)
          : null,
      checkoutAction: (checkoutAction != null)
          ? checkoutAction!.toEntity(appId: appId)
          : null,
      backToShopAction: (backToShopAction != null)
          ? backToShopAction!.toEntity(appId: appId)
          : null,
      openProductAction: (openProductAction != null)
          ? openProductAction!.toEntity(appId: appId)
          : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
    );
  }

  static Future<CartModel?> fromEntity(
      String documentID, CartEntity? entity) async {
    if (entity == null) return null;
    return CartModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      title: entity.title,
      description: entity.description,
      checkoutText: entity.checkoutText,
      itemImageBackground:
          await BackgroundModel.fromEntity(entity.itemImageBackground),
      itemDetailBackground:
          await BackgroundModel.fromEntity(entity.itemDetailBackground),
      checkoutAction: await ActionModel.fromEntity(entity.checkoutAction),
      backToShopAction: await ActionModel.fromEntity(entity.backToShopAction),
      openProductAction: await ActionModel.fromEntity(entity.openProductAction),
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<CartModel?> fromEntityPlus(
      String documentID, CartEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    ShopModel? shopHolder;
    if (entity.shopId != null) {
      try {
        shopHolder = await shopRepository(appId: appId)!.get(entity.shopId);
      } on Exception catch (e) {
        print('Error whilst trying to initialise shop');
        print('Error whilst retrieving shop with id ${entity.shopId}');
        print('Exception: $e');
      }
    }

    return CartModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      title: entity.title,
      description: entity.description,
      checkoutText: entity.checkoutText,
      shop: shopHolder,
      itemImageBackground: await BackgroundModel.fromEntityPlus(
          entity.itemImageBackground,
          appId: appId),
      itemDetailBackground: await BackgroundModel.fromEntityPlus(
          entity.itemDetailBackground,
          appId: appId),
      checkoutAction:
          await ActionModel.fromEntityPlus(entity.checkoutAction, appId: appId),
      backToShopAction: await ActionModel.fromEntityPlus(
          entity.backToShopAction,
          appId: appId),
      openProductAction: await ActionModel.fromEntityPlus(
          entity.openProductAction,
          appId: appId),
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
    );
  }
}
