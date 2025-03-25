import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// !CicloVidaScreen
/// Permite entender cómo funciona el ciclo de vida
/// de un StatefulWidget en Flutter.
class CicloVidaScreen extends StatefulWidget {
  const CicloVidaScreen({super.key});

  @override
  State<CicloVidaScreen> createState() => _CicloVidaScreenState();
}

class _CicloVidaScreenState extends State<CicloVidaScreen> {
  String texto = "Texto inicial 🟢";

  /// Se ejecuta una vez cuando la pantalla es creada.
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      debugPrint("🟢 initState() -> La pantalla se ha inicializado");
    }
  }

  /// Se ejecuta cada vez que las dependencias del widget cambian.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (kDebugMode) {
      debugPrint("🟡 didChangeDependencies() -> Tema actual");
    }
  }

  /// Se ejecuta cada vez que el widget es reconstruido.
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
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Regresar"),
            ),
          ],
        ),
      ),
    );
  }

  /// Actualiza el texto en pantalla y muestra el cambio.
  void actualizarTexto() {
    setState(() {
      texto = "Texto actualizado 🟠";
      if (kDebugMode) {
        debugPrint("🟠 setState() -> Estado actualizado");
      }
    });
  }

  /// Se ejecuta cuando el widget es eliminado de la memoria.
  @override
  void dispose() {
    if (kDebugMode) {
      debugPrint("🔴 dispose() -> La pantalla se ha destruido");
    }
    super.dispose();
  }
}
