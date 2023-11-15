import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'address_viewmodel.dart';

class AddressView extends StackedView<AddressViewModel> {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddressViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  AddressViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddressViewModel();
}
