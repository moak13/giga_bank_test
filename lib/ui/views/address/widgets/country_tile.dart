import 'package:flutter/material.dart';

import '../../../../data_model/country.dart';

class CountryTile extends StatelessWidget {
  final Country country;
  final VoidCallback? onTap;
  const CountryTile({
    super.key,
    required this.country,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.only(
          right: 20,
        ),
        padding: const EdgeInsets.only(
          left: 12,
          right: 30,
        ),
        child: ListTile(
          onTap: onTap,
          title: Text(
            country.name ?? '--',
          ),
          trailing: Text(
            country.flag ?? '--',
          ),
        ),
      ),
    );
  }
}
