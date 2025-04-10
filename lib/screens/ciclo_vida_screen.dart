import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CicloVidaScreen extends StatefulWidget {
  const CicloVidaScreen({super.key});
  @override
  State<CicloVidaScreen> createState() => _CicloVidaScreenState();
}

class _CicloVidaScreenState extends State<CicloVidaScreen> {
  String texto = "Texto inicial 🟢";

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      debugPrint("🟢 initState() -> La pantalla se ha inicializado");
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (kDebugMode) {
      debugPrint("🟡 didChangeDependencies() -> Tema actual");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      debugPrint("🔵 build() -> Construyendo la pantalla");
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ciclo de Vida en Flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(texto, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: actualizarTexto,
              child: const Text("Actualizar Texto"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/home_screen'),
              child: const Text("Regresar a Inicio"),
            ),
          ],
        ),
      ),
    );
  }

  void actualizarTexto() {
    setState(() {
      texto = "Texto actualizado 🟠";
      if (kDebugMode) {
        debugPrint("🟠 setState() -> Estado actualizado");
      }
    });
  }

  @override
  void dispose() {
    if (kDebugMode) {
      debugPrint("🔴 dispose() -> La pantalla se ha destruido");
    }
    super.dispose();
  }
}