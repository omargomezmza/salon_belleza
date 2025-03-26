import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salon_belleza/screens/login_screen.dart';
import 'package:salon_belleza/screens/profile_screen.dart';
import 'package:salon_belleza/screens/service_screen.dart';
import '../widgets/menu_drawer.dart';
// Importa el menú

class HomeScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  DateTime? _lastPressed;

  // Método para manejar el retroceso
  bool _onBackPressed(BuildContext context) {
    DateTime now = DateTime.now();
    if (_lastPressed == null ||
        now.difference(_lastPressed!) > Duration(seconds: 2)) {
      _lastPressed = now;
      // Si no se presiona el botón de retroceso rápidamente, mostramos el mensaje
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Presiona de nuevo para cerrar la app'),
          duration: Duration(seconds: 2),
        ),
      );
      return false; // No se cierra la app aún
    } else {
      // Si se presiona el botón de retroceso rápidamente, cerramos la app
      SystemNavigator.pop(); // Cierra la aplicación
      return true; // No hacer nada más
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Abre el Drawer
              },
            );
          },
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Salón de Belleza'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              if (user != null) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProfileScreen(userName: user?.displayName ?? '')),
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              }
            },
          ),
        ],
        centerTitle: true, // Asegura que el título esté centrado
      ),
      drawer: MenuDrawer(), // Usa el menú aquí
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '¡Bienvenido al Salón de Belleza!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navegar a la pantalla de servicios
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ServiceScreen()),
                  );
                },
                child: const Text('Seleccionar servicio'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
