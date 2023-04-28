import 'dart:convert';

import 'package:fineline_coffee/core/api/api_paths.dart';
import 'package:fineline_coffee/core/errors/exception.dart';
import 'package:fineline_coffee/data/drink_model.dart';
import 'package:http/http.dart' as http;

abstract class DataSource {
  Future<List<DrinkModel>> fetchDrinks();
}

class DataSourceImpl implements DataSource {
  final http.Client client;
  const DataSourceImpl(this.client);

  @override
  Future<List<DrinkModel>> fetchDrinks() async {
    final http.Response response = await client.get(Uri.parse(Api.fetchDrinks));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<DrinkModel> drinks = data.map<DrinkModel>((drink) {
        return DrinkModel.fromJson(drink);
      }).toList();
      return drinks;
    } else {
      throw const ServerException("error fetching drinks");
    }
  }
}
