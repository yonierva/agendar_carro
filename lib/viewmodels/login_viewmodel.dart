import 'package:flutter/material.dart';
import 'package:myapp/models/user.dart';  // Asegúrate de tener el archivo User definido.

class LoginViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<bool> login(User user) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    // Example validation
    if (user.username == 'admin' && user.password == 'admin') {
      _isLoading = false;
      notifyListeners();
      return true;
    } else {
      _isLoading = false;
      _errorMessage = 'Invalid username or password';
      notifyListeners();
      return false;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
