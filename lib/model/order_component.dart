/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_shop_model/model/order_component_bloc.dart';
import 'package:eliud_pkg_shop_model/model/order_component_event.dart';
import 'package:eliud_pkg_shop_model/model/order_model.dart';
import 'package:eliud_pkg_shop_model/model/order_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_model/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core_model/model/app_model.dart';

/*
 * AbstractOrderComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractOrderComponent extends StatelessWidget {
  static String componentName = "orders";
  final AppModel app;
  final String orderId;

  /*
   * Construct AbstractOrderComponent
   */
  AbstractOrderComponent({super.key, required this.app, required this.orderId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderComponentBloc>(
      create: (context) => OrderComponentBloc(
          orderRepository: orderRepository(appId: app.documentID)!)
        ..add(FetchOrderComponent(id: orderId)),
      child: _orderBlockBuilder(context),
    );
  }

  Widget _orderBlockBuilder(BuildContext context) {
    return BlocBuilder<OrderComponentBloc, OrderComponentState>(
        builder: (context, state) {
      if (state is OrderComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is OrderComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is OrderComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(app)
              .frontEndStyle()
              .progressIndicatorStyle()
              .progressIndicator(app, context),
        );
      }
    });
  }

  /*
   * Implement this method to provide your widget
   */
  Widget yourWidget(BuildContext context, OrderModel value);
}
