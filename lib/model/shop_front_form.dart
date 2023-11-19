/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shop_front_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_model/style/style_registry.dart';

import 'package:eliud_core/model/internal_component.dart';
import 'package:eliud_core/tools/bespoke_formfields.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_shop_model/model/model_export.dart';

import 'package:eliud_pkg_shop_model/model/shop_front_list_bloc.dart';
import 'package:eliud_pkg_shop_model/model/shop_front_list_event.dart';
import 'package:eliud_pkg_shop_model/model/shop_front_model.dart';
import 'package:eliud_pkg_shop_model/model/shop_front_form_bloc.dart';
import 'package:eliud_pkg_shop_model/model/shop_front_form_event.dart';
import 'package:eliud_pkg_shop_model/model/shop_front_form_state.dart';

class ShopFrontForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final ShopFrontModel? value;
  final ActionModel? submitAction;

  ShopFrontForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the ShopFrontForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<ShopFrontFormBloc>(
        create: (context) => ShopFrontFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseShopFrontFormEvent(value: value)),
        child: _MyShopFrontForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<ShopFrontFormBloc>(
        create: (context) => ShopFrontFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseShopFrontFormNoLoadEvent(value: value)),
        child: _MyShopFrontForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update ShopFront'
                      : 'Add ShopFront'),
          body: BlocProvider<ShopFrontFormBloc>(
            create: (context) => ShopFrontFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseShopFrontFormEvent(value: value)
                : InitialiseNewShopFrontFormEvent())),
            child: _MyShopFrontForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyShopFrontForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyShopFrontForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyShopFrontForm> createState() => _MyShopFrontFormState(formAction);
}

class _MyShopFrontFormState extends State<_MyShopFrontForm> {
  final FormAction? formAction;
  late ShopFrontFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _shop;
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _cardElevationController =
      TextEditingController();
  final TextEditingController _cardAxisSpacingController =
      TextEditingController();
  int? _scrollDirectionSelectedRadioTile;

  _MyShopFrontFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<ShopFrontFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _titleController.addListener(_onTitleChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _sizeController.addListener(_onSizeChanged);
    _cardElevationController.addListener(_onCardElevationChanged);
    _cardAxisSpacingController.addListener(_onCardAxisSpacingChanged);
    _scrollDirectionSelectedRadioTile = 0;
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<ShopFrontFormBloc, ShopFrontFormState>(
        builder: (context, state) {
      if (state is ShopFrontFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is ShopFrontFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _titleController.text = state.value!.title.toString();
        _descriptionController.text = state.value!.description.toString();
        if (state.value!.shop != null) {
          _shop = state.value!.shop!.documentID;
        } else {
          _shop = "";
        }
        _sizeController.text = state.value!.size.toString();
        _cardElevationController.text = state.value!.cardElevation.toString();
        _cardAxisSpacingController.text =
            state.value!.cardAxisSpacing.toString();
        if (state.value!.scrollDirection != null) {
          _scrollDirectionSelectedRadioTile =
              state.value!.scrollDirection!.index;
        } else {
          _scrollDirectionSelectedRadioTile = 0;
        }
      }
      if (state is ShopFrontFormInitialized) {
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
                validator: (_) => state is DocumentIDShopFrontFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'description',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _titleController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is TitleShopFrontFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'description',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _descriptionController,
                keyboardType: TextInputType.text,
                validator: (_) => state is DescriptionShopFrontFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Size',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _sizeController,
                keyboardType: TextInputType.number,
                validator: (_) =>
                    state is SizeShopFrontFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Card Elevation',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _cardElevationController,
                keyboardType: TextInputType.number,
                validator: (_) => state is CardElevationShopFrontFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Card Axis Spacing',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _cardAxisSpacingController,
                keyboardType: TextInputType.number,
                validator: (_) => state is CardAxisSpacingShopFrontFormError
                    ? state.message
                    : null,
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
                .groupTitle(widget.app, context, 'Action After Buy')));

        children.add(ActionField(
            widget.app, state.value!.buyAction, _onBuyActionChanged));

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
                .groupTitle(widget.app, context, 'Open product action')));

        children.add(ActionField(widget.app, state.value!.openProductAction,
            _onOpenProductActionChanged));

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
                .groupTitle(widget.app, context, 'View')));

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
                .groupTitle(widget.app, context, 'Item Card Background')));

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
                .groupTitle(widget.app, context, 'Item Detail Background')));

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
                .groupTitle(widget.app, context, 'Add to Cart Background')));

        children.add(RgbField(widget.app, "Add To Cart Color",
            state.value!.addToCartColor, _onAddToCartColorChanged));

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
                .groupTitle(widget.app, context, 'Scroll Direction')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _scrollDirectionSelectedRadioTile,
                'horizontal',
                'horizontal',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionScrollDirection(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _scrollDirectionSelectedRadioTile,
                'vertical',
                'vertical',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionScrollDirection(val)));

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
                onPressed: _readOnly(accessState, state)
                    ? null
                    : () {
                        if (state is ShopFrontFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<ShopFrontListBloc>(context)
                                .add(UpdateShopFrontList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              title: state.value!.title,
                              description: state.value!.description,
                              shop: state.value!.shop,
                              size: state.value!.size,
                              cardElevation: state.value!.cardElevation,
                              cardAxisSpacing: state.value!.cardAxisSpacing,
                              itemCardBackground:
                                  state.value!.itemCardBackground,
                              addToCartColor: state.value!.addToCartColor,
                              scrollDirection: state.value!.scrollDirection,
                              buyAction: state.value!.buyAction,
                              openProductAction: state.value!.openProductAction,
                              padding: state.value!.padding,
                              conditions: state.value!.conditions,
                            )));
                          } else {
                            BlocProvider.of<ShopFrontListBloc>(context)
                                .add(AddShopFrontList(
                                    value: ShopFrontModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              title: state.value!.title,
                              description: state.value!.description,
                              shop: state.value!.shop,
                              size: state.value!.size,
                              cardElevation: state.value!.cardElevation,
                              cardAxisSpacing: state.value!.cardAxisSpacing,
                              itemCardBackground:
                                  state.value!.itemCardBackground,
                              addToCartColor: state.value!.addToCartColor,
                              scrollDirection: state.value!.scrollDirection,
                              buyAction: state.value!.buyAction,
                              openProductAction: state.value!.openProductAction,
                              padding: state.value!.padding,
                              conditions: state.value!.conditions,
                            )));
                          }
                          if (widget.submitAction != null) {
                            eliudrouter.Router.navigateTo(
                                context, widget.submitAction!);
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
        .add(ChangedShopFrontDocumentID(value: _documentIDController.text));
  }

  void _onTitleChanged() {
    _myFormBloc.add(ChangedShopFrontTitle(value: _titleController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc
        .add(ChangedShopFrontDescription(value: _descriptionController.text));
  }

  void _onShopSelected(String? val) {
    setState(() {
      _shop = val;
    });
    _myFormBloc.add(ChangedShopFrontShop(value: val));
  }

  void _onSizeChanged() {
    _myFormBloc.add(ChangedShopFrontSize(value: _sizeController.text));
  }

  void _onCardElevationChanged() {
    _myFormBloc.add(
        ChangedShopFrontCardElevation(value: _cardElevationController.text));
  }

  void _onCardAxisSpacingChanged() {
    _myFormBloc.add(ChangedShopFrontCardAxisSpacing(
        value: _cardAxisSpacingController.text));
  }

  void _onAddToCartColorChanged(value) {
    _myFormBloc.add(ChangedShopFrontAddToCartColor(value: value));
  }

  void setSelectionScrollDirection(int? val) {
    setState(() {
      _scrollDirectionSelectedRadioTile = val;
    });
    _myFormBloc
        .add(ChangedShopFrontScrollDirection(value: toScrollDirection(val)));
  }

  void _onBuyActionChanged(value) {
    _myFormBloc.add(ChangedShopFrontBuyAction(value: value));
  }

  void _onOpenProductActionChanged(value) {
    _myFormBloc.add(ChangedShopFrontOpenProductAction(value: value));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _sizeController.dispose();
    _cardElevationController.dispose();
    _cardAxisSpacingController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(AccessState accessState, ShopFrontFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
