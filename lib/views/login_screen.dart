import 'package:flutter/material.dart';
import 'package:myapp/viewmodels/login_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:myapp/models/user.dart'; // Asegúrate de importar el modelo de User.

class LoginScreen extends StatefulWidget {
  final LoginViewModel viewModel;
  const LoginScreen({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final user = User(
      username: username,
      password: password,
    ); // Crear una instancia de User
    widget.viewModel.login(user); // Pasar el objeto User al viewModel
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: ChangeNotifierProvider.value(
        value: widget.viewModel,
        child: Consumer<LoginViewModel>(
          builder: (context, viewModel, _) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: viewModel.isLoading ? null : _login,
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 16),
                  viewModel.isLoading
                      ? const CircularProgressIndicator()
                      : Text(
                        viewModel.errorMessage.isEmpty
                            ? ""
                            : viewModel.errorMessage,
                      ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
