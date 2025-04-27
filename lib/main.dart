import 'package:flutter/material.dart';
import 'package:myapp/views/login_screen.dart';
import 'package:myapp/viewmodels/login_viewmodel.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // CAMBIA AQUÍ
      home: LoginScreen(
        viewModel: LoginViewModel(),
      ), // <-- aquí ponemos el LoginScreen
    );
  }
}
