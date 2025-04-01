import 'package:flutter/material.dart';
import 'dart:async';

class ContadorScreen extends StatefulWidget {
  const ContadorScreen({Key? key}) : super(key: key);

  @override
  _ContadorScreenState createState() => _ContadorScreenState();
}

class _ContadorScreenState extends State<ContadorScreen> {
  int _contador = 0;
  Timer? _timer; // Declaramos el Timer como nullable para poder cancelarlo sin errores.
  bool _estaPausado = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancelamos el Timer si está activo.
    super.dispose();
  }

  void _iniciarContador() {
    if (_estaPausado) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _contador++;
        });
      });
      setState(() {
        _estaPausado = false;
      });
    }
  }

  void _pausarContador() {
    _timer?.cancel();
    setState(() {
      _estaPausado = true;
    });
  }

  void _reiniciarContador() {
    _timer?.cancel();
    setState(() {
      _contador = 0;
      _estaPausado = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_contador',
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _iniciarContador,
                  child: const Text('Iniciar'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _pausarContador,
                  child: const Text('Pausar'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _reiniciarContador,
                  child: const Text('Reiniciar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}