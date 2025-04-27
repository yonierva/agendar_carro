class Carro {
  final String id;
  final String conductor;
  final String placa;
  final String imagen;

  Carro({required this.id,required this.conductor,required this.placa,required this.imagen,});

   // Método para convertir el JSON en un objeto Car
  factory Carro.fromJson(Map<String, dynamic> json) {
    return Carro(
      id: json['id'] as String,
      conductor: json['conductor'] as String,
      placa: json['placa'] as String,
      imagen: json['imagen'] as String,
    );
  }

  // Método para convertir el objeto Car a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'conductor': conductor,
      'placa': placa,
      'imagen': imagen,
    };
  }
}