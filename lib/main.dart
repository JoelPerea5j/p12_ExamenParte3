import 'package:flutter/material.dart';

class Cliente {
  final String nombre;
  final String apellido;
  final String ine;
  final String domicilio;
  final String fechaNacimiento;
  Cliente({
    required this.nombre,
    required this.apellido,
    required this.ine,
    required this.domicilio,
    required this.fechaNacimiento,
  });
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perea Columna stack'),
        ),
        body: ClienteList(),
      ),
    );
  }
}

class ClienteList extends StatelessWidget {
  final List<Cliente> clientes = [
    Cliente(
      nombre: 'Juan',
      apellido: 'Pérez',
      ine: '1234567890',
      domicilio: 'Calle Principal 123',
      fechaNacimiento: '01/01/1990',
    ),
    Cliente(
      nombre: 'María',
      apellido: 'Gómez',
      ine: '0987654321',
      domicilio: 'Avenida Secundaria 456',
      fechaNacimiento: '02/02/1995',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: clientes.map((cliente) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: clientes.indexOf(cliente) % 2 == 0
                    ? Colors.blue[100]
                    : Colors.green[100],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nombre: ${cliente.nombre} ${cliente.apellido}'),
                  Text('INE: ${cliente.ine}'),
                  Text('Domicilio: ${cliente.domicilio}'),
                  Text('Fecha de Nacimiento: ${cliente.fechaNacimiento}'),
                ],
              ),
            ),
            if (clientes.indexOf(cliente) < clientes.length - 1)
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
          ],
        );
      }).toList(),
    );
  }
}
