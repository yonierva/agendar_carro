import 'package:flutter/material.dart';
import 'package:myapp/views/carro_screen.dart'; // Asegúrate de importar tu CarScreen
import 'package:provider/provider.dart';
import 'package:myapp/viewmodels/carro_viewmodel.dart';
import 'scanqr_screen.dart'; // Asegúrate de importar el CarViewModel

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navegar a la lista de carros
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                      create: (context) => CarViewModel()..fetchCars(),
                      child: CarScreen(),
                    ),
                  ),
                );
              },
              child: const Text('Ver lista de carros'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de escanear QR (por ahora puedes dejarla vacía)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScanQrScreen(),
                  ),
                );
              },
              child: const Text('Escanear QR'),
            ),
          ],
        ),
      ),
    );
  }
}

