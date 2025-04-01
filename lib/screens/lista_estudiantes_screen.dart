import 'package:flutter/material.dart';
import '../data/estudiantes_data.dart'; // Importa la lista de estudiantes

class ListaEstudiantesScreen extends StatelessWidget {
  const ListaEstudiantesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Estudiantes'),
      ),
      body: ListView.builder(
        itemCount: estudiantes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(estudiantes[index]),
          );
        },
      ),
    );
  }
}