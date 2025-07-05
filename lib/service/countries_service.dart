import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/countries.dart';

class CountriesService {
  Future<List<Countries>> getCountries() async {
    var response = await http.get(
      Uri.parse("https://restcountries.com/v3.1/all"),
    );

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);

      return jsonResponse.map((item) => Countries.fromJson(item)).toList();
    } else {
      throw Exception("Erro ao carregar os países: ${response.statusCode}");

    }
  }
}
