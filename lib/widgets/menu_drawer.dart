// TODO Implement this library.
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menú',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {
              // Acción para la opción de inicio
              Navigator.pop(context); // Cierra el Drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configuración'),
            onTap: () {
              // Acción para la opción de configuración
              Navigator.pop(context); // Cierra el Drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('Contacto'),
            onTap: () {
              // Acción para la opción de contacto
              Navigator.pop(context); // Cierra el Drawer
            },
          ),
        ],
      ),
    );
  }
}
