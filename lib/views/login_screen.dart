import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/viewmodels/login_viewmodel.dart';
import 'package:myapp/views/home_screen.dart';

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
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
  final username = _usernameController.text;
  final password = _passwordController.text;
  final user = User(username: username, password: password);

  bool isSuccess = await widget.viewModel.login(user);

  if (isSuccess) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  } else {
    setState(() {
      // Mostrar error
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
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
              onPressed: widget.viewModel.isLoading ? null : _login,
              child: const Text('Login'),
            ),
            if (widget.viewModel.isLoading) ...[
              const SizedBox(height: 16),
              const CircularProgressIndicator(),
            ],
            if (widget.viewModel.errorMessage.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(widget.viewModel.errorMessage, style: TextStyle(color: Colors.red)),
            ],
          ],
        ),
      ),
    );
  }
}
