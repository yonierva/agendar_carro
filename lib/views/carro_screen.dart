import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/viewmodels/carro_viewmodel.dart';
import 'package:myapp/models/carro.dart';

class CarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
return Scaffold(
      appBar: AppBar(title: const Text('Carros')),
      body: Consumer<CarViewModel>(
        builder: (context, carViewModel, _) {
          if (carViewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (carViewModel.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                carViewModel.errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          // Mostrar la lista de carros
          return ListView.builder(
            itemCount: carViewModel.cars.length,
            itemBuilder: (context, index) {
              Carro car = carViewModel.cars[index];
              return ListTile(
                title: Text(car.conductor),
                subtitle: Text(car.placa),
                leading: Image.network(car.imagen),
              );
            },
          );
        },
      ),
    );
  }
}
