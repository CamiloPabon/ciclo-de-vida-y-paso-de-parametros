import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // Para codificar y decodificar JSON

class ListaEstudiantesScreen extends StatefulWidget {
  const ListaEstudiantesScreen({super.key});

  @override
  State<ListaEstudiantesScreen> createState() => _ListaEstudiantesScreenState();
}

class _ListaEstudiantesScreenState extends State<ListaEstudiantesScreen> {
  List<String> estudiantes = []; // Lista inicial de estudiantes
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cargarEstudiantes(); // Cargar los estudiantes al iniciar
  }

  Future<void> _cargarEstudiantes() async {
    final prefs = await SharedPreferences.getInstance();
    final estudiantesGuardados = prefs.getString('estudiantes');
    if (estudiantesGuardados != null) {
      setState(() {
        estudiantes = List<String>.from(jsonDecode(estudiantesGuardados));
      });
    }
  }

  Future<void> _guardarEstudiantes() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('estudiantes', jsonEncode(estudiantes));
  }

  void _agregarEstudiante(String nombre) {
    setState(() {
      estudiantes.add(nombre);
    });
    _guardarEstudiantes(); // Guardar los cambios
    _controller.clear();
  }

  void _editarEstudiante(int index, String nuevoNombre) {
    setState(() {
      estudiantes[index] = nuevoNombre;
    });
    _guardarEstudiantes(); // Guardar los cambios
  }

  void _eliminarEstudiante(int index) {
    setState(() {
      estudiantes.removeAt(index);
    });
    _guardarEstudiantes(); // Guardar los cambios
  }

  void _mostrarDialogoAgregar() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Agregar Estudiante'),
          content: TextField(
            controller: _controller,
            decoration: const InputDecoration(hintText: 'Nombre del estudiante'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  _agregarEstudiante(_controller.text);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarDialogoEditar(int index) {
    _controller.text = estudiantes[index];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar Estudiante'),
          content: TextField(
            controller: _controller,
            decoration: const InputDecoration(hintText: 'Nuevo nombre del estudiante'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  _editarEstudiante(index, _controller.text);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Estudiantes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _mostrarDialogoAgregar,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: estudiantes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(estudiantes[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => _mostrarDialogoEditar(index),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _eliminarEstudiante(index),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}