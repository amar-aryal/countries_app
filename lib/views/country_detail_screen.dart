import 'package:flutter/material.dart';
import 'package:know_my_country/core/models/country.dart';

class CountryDetailScreen extends StatelessWidget {
  final Country country;
  const CountryDetailScreen({Key? key, required this.country})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(country.name)),
    );
  }
}
