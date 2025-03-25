import 'package:flutter/material.dart';
import '../widgets/grid_view_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio')),
      body: GridViewWidget(), // Asegurémonos de que este widget no tenga scroll
    );
  }
}
