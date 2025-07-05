class Countries{
  final String name;
  final String image;
  final int population;
  final String capital;
  final String lang;
  final String currency;

  const Countries({
    required this.name,
    required this.image,
    required this.population,
    required this.capital,
    required this.lang,
    required this.currency
  });

  factory Countries.fromJson(Map<String, dynamic> json) {
    final capitalList = json['capital'] as List<dynamic>?;
    final capital = (capitalList != null && capitalList.isNotEmpty)
        ? capitalList.first as String
        : 'Sem capital';

    final languagesMap = json['languages'] as Map<String, dynamic>?;
    final lang = (languagesMap != null && languagesMap.isNotEmpty)
        ? languagesMap.values.first.toString()
        : 'Desconhecido';

    final currenciesMap = json['currencies'] as Map<String, dynamic>?;
    final currency = (currenciesMap != null && currenciesMap.isNotEmpty)
        ? currenciesMap.values.first['name'] ?? 'Desconhecida'
        : 'Desconhecida';

    return Countries(
      name: json['name']?['common'] ?? 'Sem nome',
      image: json['flags']?['png'] ?? '',
      population: json['population'] ?? 0,
      capital: capital,
      lang: lang,
      currency: currency,
    );
  }

}
