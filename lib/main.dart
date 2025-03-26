import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:salon_belleza/firebase_options.dart';
import 'package:salon_belleza/screens/home_screen.dart';

void main() async {
  // Asegúrate de que los widgets estén correctamente inicializados
  WidgetsFlutterBinding.ensureInitialized();

  print("Inicializando Firebase...");

  try {
    // Inicializa Firebase solo una vez con las opciones correctas
    await Firebase.initializeApp(
      options:
          DefaultFirebaseOptions.currentPlatform, // Usa las opciones correctas
    );
    print("Firebase inicializado correctamente.");
  } catch (e) {
    print("Error al inicializar Firebase: $e");
  }
  // Una vez inicializado Firebase, ejecutamos la aplicación
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salón de Belleza',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), //LoginScreen(), // Pantalla inicial (login screen)
    );
  }
}
