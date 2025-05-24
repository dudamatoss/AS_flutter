import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/countries.dart';
import '../service/countries_service.dart';
import 'details_countries.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paises do Mundo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: const MyHomePage(title: 'Países do Mundo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CountriesService _countriesService = CountriesService();
  late Future<List<Countries>> _countriesFuture;

  @override
  void initState() {
    super.initState();
    _countriesFuture = _countriesService.getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Countries>>(
        future: _countriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Erro ao carregar os países.${snapshot.error}"));
          }

          if (snapshot.hasData) {
            final countries = snapshot.data ?? [];

            return ListView.separated(
              itemCount: countries.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final country = countries[index];
                return ListTile(
                  title: Text(country.name),
                  trailing: IconButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailsCountry(country: country)),
                    );
                  } , icon: Icon(Icons.info_outline)),
                );
              },
            );
          }

          return const Center(child: Text("Nenhum dado encontrado."));
        },
      ),
    );
  }
}

