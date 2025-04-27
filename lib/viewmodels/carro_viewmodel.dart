import 'package:flutter/material.dart';
import 'package:myapp/models/carro.dart';
import 'package:myapp/services/carroService.dart';

class CarViewModel extends ChangeNotifier {
  final CarService _carService = CarService();
  List<Carro> _cars = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Carro> get cars => _cars;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchCars() async {
    _isLoading = true;
    notifyListeners();
    try {
      _cars = await _carService.fetchCars();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
