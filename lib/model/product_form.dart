/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 product_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_main/model/app_model.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';

import 'package:eliud_core_main/apis/apis.dart';

import 'package:eliud_core_helpers/etc/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';
import 'package:eliud_core_main/model/internal_component.dart';
import 'package:eliud_pkg_shop_model/model/embedded_component.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_shop_model/model/model_export.dart';

import 'package:eliud_pkg_shop_model/model/product_list_bloc.dart';
import 'package:eliud_pkg_shop_model/model/product_list_event.dart';
import 'package:eliud_pkg_shop_model/model/product_model.dart';
import 'package:eliud_pkg_shop_model/model/product_form_bloc.dart';
import 'package:eliud_pkg_shop_model/model/product_form_event.dart';
import 'package:eliud_pkg_shop_model/model/product_form_state.dart';

class ProductForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final ProductModel? value;
  final ActionModel? submitAction;

  ProductForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the ProductForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<ProductFormBloc>(
        create: (context) => ProductFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseProductFormEvent(value: value)),
        child: _MyProductForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<ProductFormBloc>(
        create: (context) => ProductFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseProductFormNoLoadEvent(value: value)),
        child: _MyProductForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update Product'
                      : 'Add Product'),
          body: BlocProvider<ProductFormBloc>(
            create: (context) => ProductFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseProductFormEvent(value: value)
                : InitialiseNewProductFormEvent())),
            child: _MyProductForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyProductForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyProductForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyProductForm> createState() => _MyProductFormState(formAction);
}

class _MyProductFormState extends State<_MyProductForm> {
  final FormAction? formAction;
  late ProductFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String? _shop;

  _MyProductFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<ProductFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _titleController.addListener(_onTitleChanged);
    _aboutController.addListener(_onAboutChanged);
    _priceController.addListener(_onPriceChanged);
    _weightController.addListener(_onWeightChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFormBloc, ProductFormState>(
        builder: (context, state) {
      if (state is ProductFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is ProductFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _titleController.text = state.value!.title.toString();
        _aboutController.text = state.value!.about.toString();
        _priceController.text = state.value!.price.toString();
        _weightController.text = state.value!.weight.toString();
        if (state.value!.shop != null) {
          _shop = state.value!.shop!.documentID;
        } else {
          _shop = "";
        }
      }
      if (state is ProductFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Document ID',
                icon: Icons.vpn_key,
                readOnly: (formAction == FormAction.updateAction),
                textEditingController: _documentIDController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is DocumentIDProductFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Title',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _titleController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is TitleProductFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'About',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _aboutController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is AboutProductFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Price',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _priceController,
                keyboardType: TextInputType.number,
                validator: (_) =>
                    state is PriceProductFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Weight',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _weightController,
                keyboardType: TextInputType.number,
                validator: (_) =>
                    state is WeightProductFormError ? state.message : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Shop')));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "shops",
              value: _shop,
              trigger: (value, privilegeLevel) => _onShopSelected(value),
              optional: false),
        );

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Images')));

        children.add(Container(
            height: (fullScreenHeight(context) / 2.5),
            child: productImagesList(
                widget.app, context, state.value!.images, _onImagesChanged)));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(
                    widget.app, context, 'Position and Size of images')));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Conditions')));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

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
                        if (state is ProductFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<ProductListBloc>(context)
                                .add(UpdateProductList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              title: state.value!.title,
                              about: state.value!.about,
                              price: state.value!.price,
                              weight: state.value!.weight,
                              shop: state.value!.shop,
                              images: state.value!.images,
                              posSize: state.value!.posSize,
                            )));
                          } else {
                            BlocProvider.of<ProductListBloc>(context)
                                .add(AddProductList(
                                    value: ProductModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              title: state.value!.title,
                              about: state.value!.about,
                              price: state.value!.price,
                              weight: state.value!.weight,
                              shop: state.value!.shop,
                              images: state.value!.images,
                              posSize: state.value!.posSize,
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

  void _onDocumentIDChanged() {
    _myFormBloc
        .add(ChangedProductDocumentID(value: _documentIDController.text));
  }

  void _onTitleChanged() {
    _myFormBloc.add(ChangedProductTitle(value: _titleController.text));
  }

  void _onAboutChanged() {
    _myFormBloc.add(ChangedProductAbout(value: _aboutController.text));
  }

  void _onPriceChanged() {
    _myFormBloc.add(ChangedProductPrice(value: _priceController.text));
  }

  void _onWeightChanged() {
    _myFormBloc.add(ChangedProductWeight(value: _weightController.text));
  }

  void _onShopSelected(String? val) {
    setState(() {
      _shop = val;
    });
    _myFormBloc.add(ChangedProductShop(value: val));
  }

  void _onImagesChanged(value) {
    _myFormBloc.add(ChangedProductImages(value: value));
    setState(() {});
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _titleController.dispose();
    _aboutController.dispose();
    _priceController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, ProductFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}
