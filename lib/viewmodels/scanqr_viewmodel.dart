import 'package:flutter/material.dart';
import 'package:myapp/models/carro.dart';
import 'package:myapp/services/carroService.dart';

class ScanQrViewModel extends ChangeNotifier {
  final CarService _carService = CarService();
  Carro? _car;
  bool _isLoading = false;
  String _errorMessage = '';

  Carro? get car => _car;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchCarById(String id) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();
    
    try {
      _car = await _carService.fetchCarById(id);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
