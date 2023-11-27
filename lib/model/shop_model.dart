/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_pkg_shop_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_shop_model/model/model_export.dart';
import 'package:eliud_pkg_shop_model/model/entity_export.dart';

import 'package:eliud_pkg_shop_model/model/shop_entity.dart';

import 'package:eliud_core_helpers/query/query_tools.dart';

class ShopModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_shop_model';
  static const String id = 'shops';

  @override
  String documentID;
  @override
  String appId;
  String? description;
  String? shortDescription;
  String? currency;
  StorageConditionsModel? conditions;

  ShopModel({
    required this.documentID,
    required this.appId,
    this.description,
    this.shortDescription,
    this.currency,
    this.conditions,
  });

  @override
  ShopModel copyWith({
    String? documentID,
    String? appId,
    String? description,
    String? shortDescription,
    String? currency,
    StorageConditionsModel? conditions,
  }) {
    return ShopModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      description: description ?? this.description,
      shortDescription: shortDescription ?? this.shortDescription,
      currency: currency ?? this.currency,
      conditions: conditions ?? this.conditions,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      description.hashCode ^
      shortDescription.hashCode ^
      currency.hashCode ^
      conditions.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          shortDescription == other.shortDescription &&
          currency == other.currency &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'ShopModel{documentID: $documentID, appId: $appId, description: $description, shortDescription: $shortDescription, currency: $currency, conditions: $conditions}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    var products = await productRepository(appId: appId)!.valuesListWithDetails(
        eliudQuery: EliudQuery(theConditions: [
      EliudQueryCondition('shopId', isEqualTo: documentID),
    ]));
    referencesCollector.addAll(products.map((product) =>
        ModelReference(ProductModel.packageName, ProductModel.id, product!)));
    if (conditions != null) {
      referencesCollector
          .addAll(await conditions!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  ShopEntity toEntity({String? appId}) {
    return ShopEntity(
      appId: appId,
      description: (description != null) ? description : null,
      shortDescription: (shortDescription != null) ? shortDescription : null,
      currency: (currency != null) ? currency : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
    );
  }

  static Future<ShopModel?> fromEntity(
      String documentID, ShopEntity? entity) async {
    if (entity == null) return null;
    return ShopModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      shortDescription: entity.shortDescription,
      currency: entity.currency,
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<ShopModel?> fromEntityPlus(
      String documentID, ShopEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return ShopModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      shortDescription: entity.shortDescription,
      currency: entity.currency,
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
    );
  }
}
