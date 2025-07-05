import 'package:ap2/screens/firebase/auth/firebase_auth_servise.dart';
import 'package:flutter/material.dart';
import 'package:ap2/styles/screens_style.dart';
import '../models/countries.dart';
import '../service/countries_service.dart';
import 'details_countries.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
  final FireBaseAuthService _auth = FireBaseAuthService();

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
        title: Text(
          widget.title,
          style: HomeStyles.appBar,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
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
                style: HomeStyles.errorText,
              ),
            );
          }
          if (snapshot.hasData) {
            final countries = snapshot.data ?? [];
            //sendo usado listView aqui
            return ListView.separated(
              padding: HomeStyles.listPadding,
              itemCount: countries.length,
              separatorBuilder: (_, __) => HomeStyles.listSeparator,
              itemBuilder: (context, index) {
                final country = countries[index];
                return Container(
                  decoration: HomeStyles.cardBoxDecoration,
                  padding: HomeStyles.cardPadding,
                  child: ListTile(
                    contentPadding: HomeStyles.listTileContentPadding,
                    title: Text(
                      country.name,
                      style: HomeStyles.countryName,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.info_outline, color: HomeStyles.infoColor),
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
              style: HomeStyles.emptyText,
            ),
          );
        },
      ),
      //button flutuande de logout 
      floatingActionButton: FloatingActionButton(
          onPressed: (){
          _auth.singOut();
          },
        backgroundColor: HomeStyles.primaryColor.withOpacity(0.6),
        child: const Icon(Icons.logout, color:  Colors.white ),
        elevation: 4,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
