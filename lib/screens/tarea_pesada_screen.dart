import 'package:flutter/material.dart';
import 'dart:async';

class TareaPesadaScreen extends StatefulWidget {
  const TareaPesadaScreen({super.key});

  @override
  _TareaPesadaScreenState createState() => _TareaPesadaScreenState();
}

class _TareaPesadaScreenState extends State<TareaPesadaScreen> {
  bool _estaProcesando = false;

  Future<void> _simularCarga() async {
    setState(() {
      _estaProcesando = true;
    });

    // Simula una carga con un retraso de 3 segundos
    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tarea completada exitosamente')),
      );
      setState(() {
        _estaProcesando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulación de Carga'),
      ),
      body: Center(
        child: _estaProcesando
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: _simularCarga,
                child: const Text('Simular Carga'),
              ),
      ),
    );
  }
}
