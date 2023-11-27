/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_image_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_main/model/app_model.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';

import 'package:eliud_core_main/apis/apis.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';
import 'package:eliud_core_main/model/internal_component.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_shop_model/model/model_export.dart';

import 'package:eliud_pkg_shop_model/model/product_image_list_bloc.dart';
import 'package:eliud_pkg_shop_model/model/product_image_list_event.dart';
import 'package:eliud_pkg_shop_model/model/product_image_model.dart';
import 'package:eliud_pkg_shop_model/model/product_image_form_bloc.dart';
import 'package:eliud_pkg_shop_model/model/product_image_form_event.dart';
import 'package:eliud_pkg_shop_model/model/product_image_form_state.dart';

class ProductImageForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final ProductImageModel? value;
  final ActionModel? submitAction;

  ProductImageForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the ProductImageForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<ProductImageFormBloc>(
        create: (context) => ProductImageFormBloc(
          appId,
        )..add(InitialiseProductImageFormEvent(value: value)),
        child: _MyProductImageForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<ProductImageFormBloc>(
        create: (context) => ProductImageFormBloc(
          appId,
        )..add(InitialiseProductImageFormNoLoadEvent(value: value)),
        child: _MyProductImageForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update ProductImage'
                      : 'Add ProductImage'),
          body: BlocProvider<ProductImageFormBloc>(
            create: (context) => ProductImageFormBloc(
              appId,
            )..add((formAction == FormAction.updateAction
                ? InitialiseProductImageFormEvent(value: value)
                : InitialiseNewProductImageFormEvent())),
            child: _MyProductImageForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyProductImageForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyProductImageForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyProductImageForm> createState() =>
      _MyProductImageFormState(formAction);
}

class _MyProductImageFormState extends State<_MyProductImageForm> {
  final FormAction? formAction;
  late ProductImageFormBloc _myFormBloc;

  String? _image;

  _MyProductImageFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<ProductImageFormBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductImageFormBloc, ProductImageFormState>(
        builder: (context, state) {
      if (state is ProductImageFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is ProductImageFormLoaded) {
        if (state.value!.image != null) {
          _image = state.value!.image!.documentID;
        } else {
          _image = "";
        }
      }
      if (state is ProductImageFormInitialized) {
        List<Widget> children = [];
        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "platformMediums",
              value: _image,
              trigger: (value, privilegeLevel) => _onImageSelected(value),
              optional: false),
        );

        if ((formAction != FormAction.showData) &&
            (formAction != FormAction.showPreloadedData)) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .button(
                widget.app,
                context,
                label: 'Submit',
                onPressed: _readOnly(context, state)
                    ? null
                    : () {
                        if (state is ProductImageFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<ProductImageListBloc>(context)
                                .add(UpdateProductImageList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              image: state.value!.image,
                            )));
                          } else {
                            BlocProvider.of<ProductImageListBloc>(context)
                                .add(AddProductImageList(
                                    value: ProductImageModel(
                              documentID: state.value!.documentID,
                              image: state.value!.image,
                            )));
                          }
                          if (widget.submitAction != null) {
                            Apis.apis()
                                .getRouterApi()
                                .navigateTo(context, widget.submitAction!);
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      },
              ));
        }

        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .container(
                widget.app,
                context,
                Form(
                  child: ListView(
                      padding: const EdgeInsets.all(8),
                      physics: ((formAction == FormAction.showData) ||
                              (formAction == FormAction.showPreloadedData))
                          ? NeverScrollableScrollPhysics()
                          : null,
                      shrinkWrap: ((formAction == FormAction.showData) ||
                          (formAction == FormAction.showPreloadedData)),
                      children: children),
                ),
                formAction!);
      } else {
        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .progressIndicator(widget.app, context);
      }
    });
  }

  void _onImageSelected(String? val) {
    setState(() {
      _image = val;
    });
    _myFormBloc.add(ChangedProductImageImage(value: val));
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, ProductImageFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}
