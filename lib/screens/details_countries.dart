import 'package:ap2/styles/screens_style.dart';
import 'package:flutter/material.dart';
import '../models/countries.dart';

class DetailsCountry extends StatelessWidget {
  final Countries country;

  const DetailsCountry({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeStyles.secondaryColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: HomeStyles.detailPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildCountryName(),
            const SizedBox(height: 16),
            _buildCountryImage(),
            const SizedBox(height: 24),
            _buildDetailCard('Capital: ${country.capital}'),
            _buildDetailCard('População: ${country.population}'),
            _buildDetailCard('Idioma: ${country.lang}'),
            _buildDetailCard('Moeda: ${country.currency}'),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "Países do Mundo",
        style: HomeStyles.appBar,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
      backgroundColor: HomeStyles.primaryColor,
      actions: [
        Padding(
          padding: HomeStyles.imagePadding,
          child: SizedBox(
            width: HomeStyles.imageWidth,
            height: HomeStyles.imageHeight,
            child: Image.asset(
              'assets/rosa_dos_ventos.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCountryName() {
    return Text(
      country.name,
      style: HomeStyles.countryName.copyWith(
        fontSize: HomeStyles.detailTitleFontSize,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildCountryImage() {
    return Center(
      child: Image.network(
        country.image,
        height: HomeStyles.detailImageHeight,
      ),
    );
  }

  Widget _buildDetailCard(String text) {
    return Container(
      width: double.infinity,
      decoration: HomeStyles.cardBoxDecoration,
      padding: HomeStyles.cardInnerPadding,
      margin: HomeStyles.cardMargin,
      child: Text(
        text,
        style: HomeStyles.detailText,
      ),
    );
  }
}
