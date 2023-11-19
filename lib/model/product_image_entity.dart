/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_image_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core_model/tools/etc/random.dart';
import 'package:eliud_core/core/base/entity_base.dart';

class ProductImageEntity implements EntityBase {
  final String? imageId;

  ProductImageEntity({
    this.imageId,
  });

  ProductImageEntity copyWith({
    String? documentID,
    String? imageId,
  }) {
    return ProductImageEntity(
      imageId: imageId ?? this.imageId,
    );
  }

  List<Object?> get props => [
        imageId,
      ];

  @override
  String toString() {
    return 'ProductImageEntity{imageId: $imageId}';
  }

  static ProductImageEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var imageIdNewDocmentId = map['imageId'];
    if ((newDocumentIds != null) && (imageIdNewDocmentId != null)) {
      var imageIdOldDocmentId = imageIdNewDocmentId;
      imageIdNewDocmentId = newRandomKey();
      newDocumentIds[imageIdOldDocmentId] = imageIdNewDocmentId;
    }
    return ProductImageEntity(
      imageId: imageIdNewDocmentId,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (imageId != null) {
      theDocument["imageId"] = imageId;
    } else {
      theDocument["imageId"] = null;
    }
    return theDocument;
  }

  @override
  ProductImageEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static ProductImageEntity? fromJsonString(String json,
      {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  @override
  Future<Map<String, Object?>> enrichedDocument(
      Map<String, Object?> theDocument) async {
    return theDocument;
  }
}
