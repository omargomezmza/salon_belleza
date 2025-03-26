import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String userName; // El nombre del usuario

  ProfileScreen({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Perfil'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mis Datos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 40,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nombre',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          userName, // Muestra el nombre del usuario
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      // Acción para editar el nombre
                      showDialog(
                        context: context,
                        builder: (context) {
                          TextEditingController _nameController =
                              TextEditingController(text: userName);
                          return AlertDialog(
                            title: const Text('Editar Nombre'),
                            content: TextField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                labelText: 'Nuevo Nombre',
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancelar'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Aquí puedes actualizar el nombre en la base de datos o estado global
                                  print(
                                      'Nombre actualizado: ${_nameController.text}');
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Guardar'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
