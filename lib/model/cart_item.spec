{
  "id": "CartItem",
  "packageName": "eliud_pkg_shop_model",
  "packageFriendlyName": "shop",
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
    "hasPersistentRepository": false,
    "generateFirestoreRepository": false,
    "generateRepositorySingleton": false,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": false,
    "generateList": false,
    "generateDropDownButton": false,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": false
  },
  "fields": [
    {
      "fieldName": "documentID",
      "required": true,
      "displayName": "Document ID",
      "fieldType": "String",
      "group": "general",
      "defaultValue": "IDENTIFIER",
      "iconName": "vpn_key",
      "hidden": true
    },
    {
      "fieldName": "amount",
      "displayName": "Amount",
      "group": "general",
      "fieldType": "int"
    },
    {
      "fieldName": "appId",
      "required": true,
      "displayName": "App ID",
      "fieldType": "String",
      "group": "app"
    },
    {
      "fieldName": "product",
      "displayName": "Product",
      "group": "product",
      "fieldType": "Product",
      "association": true
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "app",
        "description": "App"
    },
    {
        "group": "product",
        "description": "Product"
    }
  ],
  "listFields": {
    "title": "value.amount != null ? StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.amount!.toString())) : Text('0')"
  }
}
