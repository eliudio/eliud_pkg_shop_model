/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/component_registry.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/internal_component.dart';
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_core_model/tools/component/component_spec.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';

import 'cart_component_selector.dart';
import 'order_overview_component_selector.dart';
import 'pay_component_selector.dart';
import 'pay_confirmation_component_selector.dart';
import 'product_display_component_selector.dart';
import 'shop_front_component_selector.dart';

/* 
 * Component registry contains a list of components
 */
class ComponentRegistry {
  /* 
   * Initialise the component registry
   */
  init(
    ComponentConstructor cartComponentConstructorDefault,
    ComponentEditorConstructor cartComponentEditorConstructor,
    ComponentConstructor orderOverviewComponentConstructorDefault,
    ComponentEditorConstructor orderOverviewComponentEditorConstructor,
    ComponentConstructor payComponentConstructorDefault,
    ComponentEditorConstructor payComponentEditorConstructor,
    ComponentConstructor payConfirmationComponentConstructorDefault,
    ComponentEditorConstructor payConfirmationComponentEditorConstructor,
    ComponentConstructor productDisplayComponentConstructorDefault,
    ComponentEditorConstructor productDisplayComponentEditorConstructor,
    ComponentConstructor shopFrontComponentConstructorDefault,
    ComponentEditorConstructor shopFrontComponentEditorConstructor,
  ) {
    Apis.apis().addInternalComponents('eliud_pkg_shop_model', [
      "carts",
      "orders",
      "orderOverviews",
      "pays",
      "payConfirmations",
      "products",
      "productDisplays",
      "shops",
      "shopFronts",
    ]);

    Apis.apis().register(
        componentName: "eliud_pkg_shop_model_internalWidgets",
        componentConstructor: ListComponentFactory());
    Apis.apis()
        .addDropDownSupporter("carts", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "carts",
        componentConstructor: cartComponentConstructorDefault);
    Apis.apis().addDropDownSupporter(
        "orderOverviews", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "orderOverviews",
        componentConstructor: orderOverviewComponentConstructorDefault);
    Apis.apis()
        .addDropDownSupporter("pays", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "pays",
        componentConstructor: payComponentConstructorDefault);
    Apis.apis().addDropDownSupporter(
        "payConfirmations", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "payConfirmations",
        componentConstructor: payConfirmationComponentConstructorDefault);
    Apis.apis().addDropDownSupporter(
        "productDisplays", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "productDisplays",
        componentConstructor: productDisplayComponentConstructorDefault);
    Apis.apis()
        .addDropDownSupporter("shopFronts", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "shopFronts",
        componentConstructor: shopFrontComponentConstructorDefault);
    Apis.apis().addComponentSpec('eliud_pkg_shop_model', 'shop', [
      ComponentSpec(
          'carts',
          cartComponentConstructorDefault,
          CartComponentSelector(),
          cartComponentEditorConstructor,
          ({String? appId}) => cartRepository(appId: appId)!),
      ComponentSpec(
          'orderOverviews',
          orderOverviewComponentConstructorDefault,
          OrderOverviewComponentSelector(),
          orderOverviewComponentEditorConstructor,
          ({String? appId}) => orderOverviewRepository(appId: appId)!),
      ComponentSpec(
          'pays',
          payComponentConstructorDefault,
          PayComponentSelector(),
          payComponentEditorConstructor,
          ({String? appId}) => payRepository(appId: appId)!),
      ComponentSpec(
          'payConfirmations',
          payConfirmationComponentConstructorDefault,
          PayConfirmationComponentSelector(),
          payConfirmationComponentEditorConstructor,
          ({String? appId}) => payConfirmationRepository(appId: appId)!),
      ComponentSpec(
          'productDisplays',
          productDisplayComponentConstructorDefault,
          ProductDisplayComponentSelector(),
          productDisplayComponentEditorConstructor,
          ({String? appId}) => productDisplayRepository(appId: appId)!),
      ComponentSpec(
          'shopFronts',
          shopFrontComponentConstructorDefault,
          ShopFrontComponentSelector(),
          shopFrontComponentEditorConstructor,
          ({String? appId}) => shopFrontRepository(appId: appId)!),
    ]);
    Apis.apis().registerRetrieveRepository('eliud_pkg_shop_model',
        'carts', ({String? appId}) => cartRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_shop_model',
        'memberCarts',
        ({String? appId}) => memberCartRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository('eliud_pkg_shop_model',
        'orders', ({String? appId}) => orderRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_shop_model',
        'orderOverviews',
        ({String? appId}) => orderOverviewRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository('eliud_pkg_shop_model',
        'pays', ({String? appId}) => payRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_shop_model',
        'payConfirmations',
        ({String? appId}) => payConfirmationRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository('eliud_pkg_shop_model',
        'products', ({String? appId}) => productRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_shop_model',
        'productDisplays',
        ({String? appId}) => productDisplayRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository('eliud_pkg_shop_model',
        'shops', ({String? appId}) => shopRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository('eliud_pkg_shop_model',
        'shopFronts', ({String? appId}) => shopFrontRepository(appId: appId)!);
  }
}
