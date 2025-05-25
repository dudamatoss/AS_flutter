import 'package:ap2/styles/home_style.dart';
import 'package:flutter/material.dart';
import '../models/countries.dart';

class DetailsCountry extends StatelessWidget {
  final Countries country;

  const DetailsCountry({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeStyles.secondaryColor,
      appBar: AppBar(
        title: const Text(
          "Países do Mundo",
          style: HomeStyles.appBar,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: HomeStyles.primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(
                'assets/rosa_dos_ventos.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              country.name,
              style: HomeStyles.countryName.copyWith(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Center(
              child: Image.network(
                country.image,
                height: 200,
              ),
            ),
            const SizedBox(height: 24),

            // Detalhes em Cards com largura máxima
            Container(
              width: double.infinity,
              decoration: HomeStyles.cardBoxDecoration,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Capital: ${country.capital}',
                style: HomeStyles.detailText,
              ),
            ),
            Container(
              width: double.infinity,
              decoration: HomeStyles.cardBoxDecoration,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'População: ${country.population}',
                style: HomeStyles.detailText,
              ),
            ),
            Container(
              width: double.infinity,
              decoration: HomeStyles.cardBoxDecoration,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Idioma: ${country.lang}',
                style: HomeStyles.detailText,
              ),
            ),
            Container(
              width: double.infinity,
              decoration: HomeStyles.cardBoxDecoration,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Moeda: ${country.currency}',
                style: HomeStyles.detailText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
