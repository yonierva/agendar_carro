import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/models/carro.dart';

class CarService {
  final String _url = 'https://67f7d1812466325443eadd17.mockapi.io/carros';

  Future<List<Carro>> fetchCars() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((carJson) => Carro.fromJson(carJson)).toList();
    } else {
      throw Exception('Failed to load cars');
    }
  }

  Future<Carro> fetchCarById(String id) async {
    final response = await http.get(Uri.parse('$_url/$id'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Carro.fromJson(data);
    } else {
      throw Exception('Failed to load car with id $id');
    }
  }
}
