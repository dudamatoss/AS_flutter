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
    return Countries(
      name: json['name']['common'] ?? '',
      image: json['flags']['png'] ?? '',
      population: json['population'] ?? 0,
      capital: (json['capital'] != null && json['capital'].isNotEmpty) ? json['capital'][0] : '',
      lang: json['languages'] != null ? json['languages'].values.first : '',
      currency: json['currencies'] != null ? json['currencies'].keys.first : '',
    );
  }


}
