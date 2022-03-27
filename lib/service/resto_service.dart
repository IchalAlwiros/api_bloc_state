import 'dart:convert';

import '../models/resto_models.dart';
import 'package:http/http.dart' as http;

class RestoService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static final String baseUrlImage = '${_baseUrl}images/small/';

  Future<RestaurantModel> getListResto() async {
    final response = await http.get(Uri.parse(_baseUrl + "list"));
    if (response.statusCode == 200) {
      return RestaurantModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
