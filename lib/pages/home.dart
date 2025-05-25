import 'package:ap2/styles/home_style.dart';
import 'package:flutter/material.dart';
import '../models/countries.dart';
import '../service/countries_service.dart';
import 'details_countries.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Países do Mundo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: HomeStyles.secondaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: HomeStyles.primaryColor,
        ),
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
      backgroundColor: HomeStyles.secondaryColor,
      appBar: AppBar(
        title: const Text(
          'Países do Mundo',
          style: HomeStyles.appBar,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
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
      body: FutureBuilder<List<Countries>>(
        future: _countriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Erro ao carregar os países: ${snapshot.error}",
                style: const TextStyle(color: Colors.white),
              ),
            );
          }

          if (snapshot.hasData) {
            final countries = snapshot.data ?? [];

            return ListView.separated(
              padding: const EdgeInsets.all(15),
              itemCount: countries.length,
              separatorBuilder: (_, __) => const SizedBox(height: 25),
              itemBuilder: (context, index) {
                final country = countries[index];
                return Container(
                  decoration: HomeStyles.cardBoxDecoration,
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    title: Text(
                      country.name,
                      style: HomeStyles.countryName,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.info_outline, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsCountry(country: country),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: Text(
              "Nenhum dado encontrado.",
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
