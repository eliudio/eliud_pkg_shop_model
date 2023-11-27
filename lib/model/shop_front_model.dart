/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_front_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_pkg_shop_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop_model/model/model_export.dart';
import 'package:eliud_pkg_shop_model/model/entity_export.dart';

import 'package:eliud_pkg_shop_model/model/shop_front_entity.dart';

enum ScrollDirection { horizontal, vertical, unknown }

ScrollDirection toScrollDirection(int? index) {
  switch (index) {
    case 0:
      return ScrollDirection.horizontal;
    case 1:
      return ScrollDirection.vertical;
  }
  return ScrollDirection.unknown;
}

class ShopFrontModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_shop_model';
  static const String id = 'shopFronts';

  @override
  String documentID;
  @override
  String appId;
  String? title;
  String? description;
  ShopModel? shop;
  double? size;
  double? cardElevation;
  double? cardAxisSpacing;
  BackgroundModel? itemCardBackground;
  RgbModel? addToCartColor;
  ScrollDirection? scrollDirection;
  ActionModel? buyAction;
  ActionModel? openProductAction;
  EdgeInsetsGeometryModel? padding;
  StorageConditionsModel? conditions;

  ShopFrontModel({
    required this.documentID,
    required this.appId,
    this.title,
    this.description,
    this.shop,
    this.size,
    this.cardElevation,
    this.cardAxisSpacing,
    this.itemCardBackground,
    this.addToCartColor,
    this.scrollDirection,
    this.buyAction,
    this.openProductAction,
    this.padding,
    this.conditions,
  });

  @override
  ShopFrontModel copyWith({
    String? documentID,
    String? appId,
    String? title,
    String? description,
    ShopModel? shop,
    double? size,
    double? cardElevation,
    double? cardAxisSpacing,
    BackgroundModel? itemCardBackground,
    RgbModel? addToCartColor,
    ScrollDirection? scrollDirection,
    ActionModel? buyAction,
    ActionModel? openProductAction,
    EdgeInsetsGeometryModel? padding,
    StorageConditionsModel? conditions,
  }) {
    return ShopFrontModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      title: title ?? this.title,
      description: description ?? this.description,
      shop: shop ?? this.shop,
      size: size ?? this.size,
      cardElevation: cardElevation ?? this.cardElevation,
      cardAxisSpacing: cardAxisSpacing ?? this.cardAxisSpacing,
      itemCardBackground: itemCardBackground ?? this.itemCardBackground,
      addToCartColor: addToCartColor ?? this.addToCartColor,
      scrollDirection: scrollDirection ?? this.scrollDirection,
      buyAction: buyAction ?? this.buyAction,
      openProductAction: openProductAction ?? this.openProductAction,
      padding: padding ?? this.padding,
      conditions: conditions ?? this.conditions,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      title.hashCode ^
      description.hashCode ^
      shop.hashCode ^
      size.hashCode ^
      cardElevation.hashCode ^
      cardAxisSpacing.hashCode ^
      itemCardBackground.hashCode ^
      addToCartColor.hashCode ^
      scrollDirection.hashCode ^
      buyAction.hashCode ^
      openProductAction.hashCode ^
      padding.hashCode ^
      conditions.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopFrontModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          description == other.description &&
          shop == other.shop &&
          size == other.size &&
          cardElevation == other.cardElevation &&
          cardAxisSpacing == other.cardAxisSpacing &&
          itemCardBackground == other.itemCardBackground &&
          addToCartColor == other.addToCartColor &&
          scrollDirection == other.scrollDirection &&
          buyAction == other.buyAction &&
          openProductAction == other.openProductAction &&
          padding == other.padding &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'ShopFrontModel{documentID: $documentID, appId: $appId, title: $title, description: $description, shop: $shop, size: $size, cardElevation: $cardElevation, cardAxisSpacing: $cardAxisSpacing, itemCardBackground: $itemCardBackground, addToCartColor: $addToCartColor, scrollDirection: $scrollDirection, buyAction: $buyAction, openProductAction: $openProductAction, padding: $padding, conditions: $conditions}';
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
    if (itemCardBackground != null) {
      referencesCollector
          .addAll(await itemCardBackground!.collectReferences(appId: appId));
    }
    if (addToCartColor != null) {
      referencesCollector
          .addAll(await addToCartColor!.collectReferences(appId: appId));
    }
    if (buyAction != null) {
      referencesCollector
          .addAll(await buyAction!.collectReferences(appId: appId));
    }
    if (openProductAction != null) {
      referencesCollector
          .addAll(await openProductAction!.collectReferences(appId: appId));
    }
    if (padding != null) {
      referencesCollector
          .addAll(await padding!.collectReferences(appId: appId));
    }
    if (conditions != null) {
      referencesCollector
          .addAll(await conditions!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  ShopFrontEntity toEntity({String? appId}) {
    return ShopFrontEntity(
      appId: appId,
      title: (title != null) ? title : null,
      description: (description != null) ? description : null,
      shopId: (shop != null) ? shop!.documentID : null,
      size: (size != null) ? size : null,
      cardElevation: (cardElevation != null) ? cardElevation : null,
      cardAxisSpacing: (cardAxisSpacing != null) ? cardAxisSpacing : null,
      itemCardBackground: (itemCardBackground != null)
          ? itemCardBackground!.toEntity(appId: appId)
          : null,
      addToCartColor: (addToCartColor != null)
          ? addToCartColor!.toEntity(appId: appId)
          : null,
      scrollDirection:
          (scrollDirection != null) ? scrollDirection!.index : null,
      buyAction: (buyAction != null) ? buyAction!.toEntity(appId: appId) : null,
      openProductAction: (openProductAction != null)
          ? openProductAction!.toEntity(appId: appId)
          : null,
      padding: (padding != null) ? padding!.toEntity(appId: appId) : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
    );
  }

  static Future<ShopFrontModel?> fromEntity(
      String documentID, ShopFrontEntity? entity) async {
    if (entity == null) return null;
    return ShopFrontModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      title: entity.title,
      description: entity.description,
      size: entity.size,
      cardElevation: entity.cardElevation,
      cardAxisSpacing: entity.cardAxisSpacing,
      itemCardBackground:
          await BackgroundModel.fromEntity(entity.itemCardBackground),
      addToCartColor: await RgbModel.fromEntity(entity.addToCartColor),
      scrollDirection: toScrollDirection(entity.scrollDirection),
      buyAction: await ActionModel.fromEntity(entity.buyAction),
      openProductAction: await ActionModel.fromEntity(entity.openProductAction),
      padding: await EdgeInsetsGeometryModel.fromEntity(entity.padding),
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<ShopFrontModel?> fromEntityPlus(
      String documentID, ShopFrontEntity? entity,
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

    return ShopFrontModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      title: entity.title,
      description: entity.description,
      shop: shopHolder,
      size: entity.size,
      cardElevation: entity.cardElevation,
      cardAxisSpacing: entity.cardAxisSpacing,
      itemCardBackground: await BackgroundModel.fromEntityPlus(
          entity.itemCardBackground,
          appId: appId),
      addToCartColor:
          await RgbModel.fromEntityPlus(entity.addToCartColor, appId: appId),
      scrollDirection: toScrollDirection(entity.scrollDirection),
      buyAction:
          await ActionModel.fromEntityPlus(entity.buyAction, appId: appId),
      openProductAction: await ActionModel.fromEntityPlus(
          entity.openProductAction,
          appId: appId),
      padding: await EdgeInsetsGeometryModel.fromEntityPlus(entity.padding,
          appId: appId),
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
    );
  }
}
