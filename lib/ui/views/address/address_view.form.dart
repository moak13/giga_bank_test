// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String PrefectureValueKey = 'prefecture';
const String MunicipalityValueKey = 'municipality';
const String StreetValueKey = 'street';
const String ApartmentValueKey = 'apartment';

final Map<String, TextEditingController> _AddressViewTextEditingControllers =
    {};

final Map<String, FocusNode> _AddressViewFocusNodes = {};

final Map<String, String? Function(String?)?> _AddressViewTextValidations = {
  PrefectureValueKey: null,
  MunicipalityValueKey: null,
  StreetValueKey: null,
  ApartmentValueKey: null,
};

mixin $AddressView {
  TextEditingController get prefectureController =>
      _getFormTextEditingController(PrefectureValueKey);
  TextEditingController get municipalityController =>
      _getFormTextEditingController(MunicipalityValueKey);
  TextEditingController get streetController =>
      _getFormTextEditingController(StreetValueKey);
  TextEditingController get apartmentController =>
      _getFormTextEditingController(ApartmentValueKey);

  FocusNode get prefectureFocusNode => _getFormFocusNode(PrefectureValueKey);
  FocusNode get municipalityFocusNode =>
      _getFormFocusNode(MunicipalityValueKey);
  FocusNode get streetFocusNode => _getFormFocusNode(StreetValueKey);
  FocusNode get apartmentFocusNode => _getFormFocusNode(ApartmentValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AddressViewTextEditingControllers.containsKey(key)) {
      return _AddressViewTextEditingControllers[key]!;
    }

    _AddressViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddressViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddressViewFocusNodes.containsKey(key)) {
      return _AddressViewFocusNodes[key]!;
    }
    _AddressViewFocusNodes[key] = FocusNode();
    return _AddressViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    prefectureController.addListener(() => _updateFormData(model));
    municipalityController.addListener(() => _updateFormData(model));
    streetController.addListener(() => _updateFormData(model));
    apartmentController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    prefectureController.addListener(() => _updateFormData(model));
    municipalityController.addListener(() => _updateFormData(model));
    streetController.addListener(() => _updateFormData(model));
    apartmentController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          PrefectureValueKey: prefectureController.text,
          MunicipalityValueKey: municipalityController.text,
          StreetValueKey: streetController.text,
          ApartmentValueKey: apartmentController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _AddressViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddressViewFocusNodes.values) {
      focusNode.dispose();
    }

    _AddressViewTextEditingControllers.clear();
    _AddressViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get prefectureValue =>
      this.formValueMap[PrefectureValueKey] as String?;
  String? get municipalityValue =>
      this.formValueMap[MunicipalityValueKey] as String?;
  String? get streetValue => this.formValueMap[StreetValueKey] as String?;
  String? get apartmentValue => this.formValueMap[ApartmentValueKey] as String?;

  set prefectureValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PrefectureValueKey: value}),
    );

    if (_AddressViewTextEditingControllers.containsKey(PrefectureValueKey)) {
      _AddressViewTextEditingControllers[PrefectureValueKey]?.text =
          value ?? '';
    }
  }

  set municipalityValue(String? value) {
    this.setData(
      this.formValueMap..addAll({MunicipalityValueKey: value}),
    );

    if (_AddressViewTextEditingControllers.containsKey(MunicipalityValueKey)) {
      _AddressViewTextEditingControllers[MunicipalityValueKey]?.text =
          value ?? '';
    }
  }

  set streetValue(String? value) {
    this.setData(
      this.formValueMap..addAll({StreetValueKey: value}),
    );

    if (_AddressViewTextEditingControllers.containsKey(StreetValueKey)) {
      _AddressViewTextEditingControllers[StreetValueKey]?.text = value ?? '';
    }
  }

  set apartmentValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ApartmentValueKey: value}),
    );

    if (_AddressViewTextEditingControllers.containsKey(ApartmentValueKey)) {
      _AddressViewTextEditingControllers[ApartmentValueKey]?.text = value ?? '';
    }
  }

  bool get hasPrefecture =>
      this.formValueMap.containsKey(PrefectureValueKey) &&
      (prefectureValue?.isNotEmpty ?? false);
  bool get hasMunicipality =>
      this.formValueMap.containsKey(MunicipalityValueKey) &&
      (municipalityValue?.isNotEmpty ?? false);
  bool get hasStreet =>
      this.formValueMap.containsKey(StreetValueKey) &&
      (streetValue?.isNotEmpty ?? false);
  bool get hasApartment =>
      this.formValueMap.containsKey(ApartmentValueKey) &&
      (apartmentValue?.isNotEmpty ?? false);

  bool get hasPrefectureValidationMessage =>
      this.fieldsValidationMessages[PrefectureValueKey]?.isNotEmpty ?? false;
  bool get hasMunicipalityValidationMessage =>
      this.fieldsValidationMessages[MunicipalityValueKey]?.isNotEmpty ?? false;
  bool get hasStreetValidationMessage =>
      this.fieldsValidationMessages[StreetValueKey]?.isNotEmpty ?? false;
  bool get hasApartmentValidationMessage =>
      this.fieldsValidationMessages[ApartmentValueKey]?.isNotEmpty ?? false;

  String? get prefectureValidationMessage =>
      this.fieldsValidationMessages[PrefectureValueKey];
  String? get municipalityValidationMessage =>
      this.fieldsValidationMessages[MunicipalityValueKey];
  String? get streetValidationMessage =>
      this.fieldsValidationMessages[StreetValueKey];
  String? get apartmentValidationMessage =>
      this.fieldsValidationMessages[ApartmentValueKey];
}

extension Methods on FormStateHelper {
  setPrefectureValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PrefectureValueKey] = validationMessage;
  setMunicipalityValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[MunicipalityValueKey] = validationMessage;
  setStreetValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[StreetValueKey] = validationMessage;
  setApartmentValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ApartmentValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    prefectureValue = '';
    municipalityValue = '';
    streetValue = '';
    apartmentValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      PrefectureValueKey: getValidationMessage(PrefectureValueKey),
      MunicipalityValueKey: getValidationMessage(MunicipalityValueKey),
      StreetValueKey: getValidationMessage(StreetValueKey),
      ApartmentValueKey: getValidationMessage(ApartmentValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AddressViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AddressViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      PrefectureValueKey: getValidationMessage(PrefectureValueKey),
      MunicipalityValueKey: getValidationMessage(MunicipalityValueKey),
      StreetValueKey: getValidationMessage(StreetValueKey),
      ApartmentValueKey: getValidationMessage(ApartmentValueKey),
    });
