import 'package:flutter/material.dart';
import '../models/countries.dart';


class DetailsCountry extends StatelessWidget {
  final Countries country;

  const DetailsCountry({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paises do Mundo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(country.name),
            const SizedBox(height: 8),
            Center(
              child: Image.network(
                country.image,
                height: 150,
              ),
            ),
            const SizedBox(height: 16),
            Text('Capital: ${country.capital}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('População: ${country.population}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Idioma: ${country.lang}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Moeda: ${country.currency}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
