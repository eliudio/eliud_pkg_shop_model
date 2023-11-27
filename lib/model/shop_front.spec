{
  "id": "ShopFront",
  "packageName": "eliud_pkg_shop_model",
  "packageFriendlyName": "shop",
  "isAppModel": true,
  "generate": {
    "generateComponent": true,
    "generateRepository": true,
    "generateCache": true,
    "hasPersistentRepository": true,
    "generateFirestoreRepository": true,
    "generateRepositorySingleton": true,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": true,
    "generateInternalComponent": true,
    "generateEmbeddedComponent": false,
    "isExtension": true,
    "documentSubCollectionOf": "app"
  },
  "codeForNewAppId": "newEntity = newEntity.copyWith(buyAction: buyAction == null ? null : buyAction!.copyWith(appId: newAppId), openProductAction: openProductAction == null ? null : openProductAction!.copyWith(appId: newAppId));",
  "fields": [
    {
      "fieldName": "documentID",
      "required": true,
      "displayName": "Document ID",
      "group": "general",
      "fieldType": "String",
      "iconName": "vpn_key"
    },
    {
      "fieldName": "appId",
      "required": true,
      "displayName": "App ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "hidden": true,
      "group": "general"
    },
    {
      "fieldName": "title",
      "displayName": "description",
      "group": "general",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "description",
      "displayName": "description",
      "group": "general",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "shop",
      "displayName": "Shop",
      "fieldType": "Shop",
      "association": true,
      "optional": false,
      "group": "shop"
    },
    {
      "fieldName": "size",
      "displayName": "Size",
      "fieldType": "double",
      "group": "general"
    },
    {
      "fieldName": "cardElevation",
      "displayName": "Card Elevation",
      "fieldType": "double",
      "group": "general"
    },
    {
      "fieldName": "cardAxisSpacing",
      "displayName": "Card Axis Spacing",
      "fieldType": "double",
      "group": "general"
    },
    {
      "fieldName": "itemCardBackground",
      "displayName": "Item Card Background",
      "fieldType": "Background",
      "optional": true,
      "group": "itemCardBackground"
    },
    {
      "fieldName": "addToCartColor",
      "displayName": " Add To Card Color",
      "defaultValue": "RgbModel(r: 255, g: 0, b: 0, opacity: 1.00)",
      "fieldType": "Rgb",
      "group": "addToCartColor",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(widget.app, \"Add To Cart Color\", state.value!.addToCartColor, _onAddToCartColorChanged)"
    },
    {
      "fieldName": "scrollDirection",
      "displayName": "Scroll Direction",
      "fieldType": "enum",
      "enumName": "ScrollDirection",
      "enumValues" : [ "horizontal", "vertical" ],
      "group": "scrollDirection"
    },
    {
      "fieldName": "buyAction",
      "fieldType": "Action",
      "bespokeFormField": "ActionField(widget.app, state.value!.buyAction, _onBuyActionChanged)",
      "group": "action"
    },
    {
      "fieldName": "openProductAction",
      "fieldType": "Action",
      "bespokeFormField": "ActionField(widget.app, state.value!.openProductAction, _onOpenProductActionChanged)",
      "group": "openProductAction"
    },
    {
      "fieldName": "padding",
      "fieldType": "EdgeInsetsGeometry",
      "group": "general"
    },
    {
      "fieldName": "conditions",
      "displayName": "Conditions",
      "fieldType": "StorageConditions",
      "group": "conditions"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "action",
        "description": "Action After Buy"
    },
    {
        "group": "openProductAction",
        "description": "Open product action"
    },
    {
        "group": "shop",
        "description": "Shop"
    },
    {
        "group": "view",
        "description": "View"
    },
    {
        "group": "itemCardBackground",
        "description": "Item Card Background"
    },
    {
        "group": "itemDetailBackground",
        "description": "Item Detail Background"
    },
    {
        "group": "addToCartColor",
        "description": "Add to Cart Background"
    },
    {
        "group": "scrollDirection",
        "description": "Scroll Direction"
    },
    {
        "group": "conditions",
        "description": "Conditions"
    }
  ],
  "listFields": {
    "title": "value.description != null ? Center(child: text(app, context, value.description!)) : Center(child: text(app, context, value.documentID))"
  },
  "depends": ["eliud_core_main"]
}
