import 'package:flutter/material.dart';

class ServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccionar Servicio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selecciona un servicio para agendar:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí iría la lógica para agendar una cita.
                Navigator.pop(context); // Volver atrás a la pantalla anterior
              },
              child: Text('Corte de Cabello'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Aquí iría la lógica para agendar una cita.
                Navigator.pop(context); // Volver atrás a la pantalla anterior
              },
              child: Text('Manicura'),
            ),
          ],
        ),
      ),
    );
  }
}
