import 'dart:convert';

import 'package:fineline_coffee/core/api/api_paths.dart';
import 'package:fineline_coffee/core/errors/exception.dart';
import 'package:fineline_coffee/data/drink_model.dart';
import 'package:http/http.dart' as http;

abstract class DataSource {
  Future<List<DrinkModel>> hotCoffees();
  Future<List<DrinkModel>> coldCoffees();
  Future<List<DrinkModel>> hotTeas();
  Future<List<DrinkModel>> coldTeas();
}

class DataSourceImpl implements DataSource {
  final http.Client client;
  const DataSourceImpl(this.client);

  @override
  Future<List<DrinkModel>> hotCoffees() async {
    final http.Response response = await client.get(Uri.parse(Api.hotCoffees));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<DrinkModel> drinks = data.map<DrinkModel>((drink) {
        return DrinkModel.fromJson(drink);
      }).toList();
      return drinks;
    } else {
      throw const ServerException("error fetching hot coffees");
    }
  }

  @override
  Future<List<DrinkModel>> coldCoffees() async {
    final http.Response response = await client.get(Uri.parse(Api.coldCoffees));
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

  @override
  Future<List<DrinkModel>> hotTeas() async {
    final http.Response response = await client.get(Uri.parse(Api.hotTeas));
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

  @override
  Future<List<DrinkModel>> coldTeas() async {
    final http.Response response = await client.get(Uri.parse(Api.coldTeas));
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
