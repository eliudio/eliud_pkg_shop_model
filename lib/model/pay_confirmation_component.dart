/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_confirmation_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_shop_model/model/pay_confirmation_component_bloc.dart';
import 'package:eliud_pkg_shop_model/model/pay_confirmation_component_event.dart';
import 'package:eliud_pkg_shop_model/model/pay_confirmation_model.dart';
import 'package:eliud_pkg_shop_model/model/pay_confirmation_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_model/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core_model/model/app_model.dart';

/*
 * AbstractPayConfirmationComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractPayConfirmationComponent extends StatelessWidget {
  static String componentName = "payConfirmations";
  final AppModel app;
  final String payConfirmationId;

  /*
   * Construct AbstractPayConfirmationComponent
   */
  AbstractPayConfirmationComponent(
      {super.key, required this.app, required this.payConfirmationId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PayConfirmationComponentBloc>(
      create: (context) => PayConfirmationComponentBloc(
          payConfirmationRepository:
              payConfirmationRepository(appId: app.documentID)!)
        ..add(FetchPayConfirmationComponent(id: payConfirmationId)),
      child: _payConfirmationBlockBuilder(context),
    );
  }

  Widget _payConfirmationBlockBuilder(BuildContext context) {
    return BlocBuilder<PayConfirmationComponentBloc,
        PayConfirmationComponentState>(builder: (context, state) {
      if (state is PayConfirmationComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is PayConfirmationComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is PayConfirmationComponentError) {
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
  Widget yourWidget(BuildContext context, PayConfirmationModel value);
}
