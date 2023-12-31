import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../data_model/country.dart';
import '../../../utils/custom_input_formatter.dart';
import '../../common/string_util.dart';
import '../../common/validator.dart';
import 'address_view.form.dart';
import 'address_viewmodel.dart';
import 'widgets/country_tile.dart';
import 'widgets/primary_button.dart';

@FormView(
  fields: [
    FormTextField(name: 'prefecture'),
    FormTextField(name: 'municipality'),
    FormTextField(name: 'street'),
    FormTextField(name: 'apartment'),
  ],
)
class AddressView extends StackedView<AddressViewModel> with $AddressView {
  AddressView({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    AddressViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Registered Address',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.grey.shade300,
              color: Colors.orange,
            ),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Text(
                'Please enter information as written on your ID document.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
                maxLines: 2,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                children: [
                  Autocomplete<Country>(
                    initialValue: TextEditingValue(
                      text: viewModel.country?.name ?? '',
                    ),
                    fieldViewBuilder: (
                      BuildContext context,
                      TextEditingController controller,
                      FocusNode focusNode,
                      VoidCallback onFieldSubmitted,
                    ) {
                      return TextFormField(
                        controller: controller,
                        focusNode: focusNode,
                        decoration: const InputDecoration(
                          hintText: 'Country',
                          suffixIcon: Icon(Icons.search),
                        ),
                        onFieldSubmitted: (value) {
                          onFieldSubmitted();
                          if (StringUtil.isNotEmpty(value)) {
                            prefectureFocusNode.requestFocus();
                          }
                        },
                        validator: (value) => Validator.validateField(
                          value,
                          error: 'required',
                        ),
                      );
                    },
                    optionsBuilder: (TextEditingValue textEditingValue) async {
                      return await viewModel.search(textEditingValue.text);
                    },
                    displayStringForOption: (option) => option.name ?? '--',
                    optionsViewBuilder: (context, onSelected, options) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          Country country = options.elementAt(index);
                          return CountryTile(
                            country: country,
                            onTap: () {
                              onSelected(country);
                            },
                          );
                        },
                        itemCount: options.length,
                      );
                    },
                    onSelected: viewModel.setSelectedCountry,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: prefectureController,
                    focusNode: prefectureFocusNode,
                    decoration: const InputDecoration(
                      hintText: 'Prefecture',
                    ),
                    validator: (value) => Validator.validateField(
                      value,
                      error: 'required',
                    ),
                    onFieldSubmitted: (value) {
                      if (StringUtil.isNotEmpty(value)) {
                        municipalityFocusNode.requestFocus();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: municipalityController,
                    focusNode: municipalityFocusNode,
                    decoration: const InputDecoration(
                      hintText: 'Municipality',
                    ),
                    validator: (value) => Validator.validateField(
                      value,
                      error: 'required',
                    ),
                    onFieldSubmitted: (value) {
                      if (StringUtil.isNotEmpty(value)) {
                        streetFocusNode.requestFocus();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: streetController,
                    focusNode: streetFocusNode,
                    decoration: const InputDecoration(
                      hintText: 'Street address (subarea - block - house)',
                    ),
                    validator: (value) => Validator.validateStreet(value),
                    inputFormatters: [
                      DashInputFormatter(),
                    ],
                    onFieldSubmitted: (value) {
                      if (StringUtil.isNotEmpty(value)) {
                        apartmentFocusNode.requestFocus();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: apartmentController,
                    focusNode: apartmentFocusNode,
                    decoration: const InputDecoration(
                      hintText: 'Apartment, Suite or Unit',
                    ),
                    validator: (value) => Validator.validateField(
                      value,
                      error: 'required',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: PrimaryButton(
                text: 'Next',
                isDisabled: viewModel.isValidForm,
                isBusy: viewModel.isBusy,
                onTap: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    viewModel.submit();
                  }
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(AddressViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(AddressViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  AddressViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddressViewModel();
}
