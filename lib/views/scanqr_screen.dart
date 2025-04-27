import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:myapp/viewmodels/scanqr_viewmodel.dart';
import 'package:provider/provider.dart';

class ScanQrScreen extends StatelessWidget {
  const ScanQrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ScanQrViewModel(),
      child: Consumer<ScanQrViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            appBar: AppBar(title: const Text('Escanear QR')),
            body: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: MobileScanner(
                    onDetect: (capture) async {
                      final List<Barcode> barcodes = capture.barcodes;
                      for (final barcode in barcodes) {
                        final carId = barcode.rawValue;
                        if (carId != null) {
                          await viewModel.fetchCarById(carId);
                          break; // Solo queremos procesar un QR
                        }
                      }
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: viewModel.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : viewModel.car != null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Carro encontrado: ${viewModel.car!.placa}'),
                                ElevatedButton(
                                  onPressed: () {
                                    // Acción al agendar
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Carro agendado!')),
                                    );
                                  },
                                  child: const Text('Agendar'),
                                ),
                              ],
                            )
                          : viewModel.errorMessage.isNotEmpty
                              ? Text('Error: ${viewModel.errorMessage}')
                              : const Text('Escanea un código QR'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
