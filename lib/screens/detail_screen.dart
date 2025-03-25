import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../utils/favorites_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends StatefulWidget {
  final int id;

  const DetailScreen({super.key, required this.id});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Item item;

  @override
  void initState() {
    super.initState();
    item = Item(id: widget.id, title: 'Item ${widget.id}');
    if (kDebugMode) {
      debugPrint("🟠 initState() Se selecciono el ${item.title}");
    }
  }

  void toggleFavorite() {
    setState(() {
      FavoritesManager.toggleFavorite(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isFavorite = FavoritesManager.isFavorite(item);

    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            debugPrint("🔵 Volviendo a la pagina de inicio");
            context.go('/'); // Vuelve a la pantalla principal
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Detalles de ${item.title}',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: toggleFavorite,
            ),
            Text(
              isFavorite ? 'Añadido a Favoritos' : 'No está en Favoritos',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
