import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../utils/favorites_manager.dart';
import 'package:go_router/go_router.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({super.key});

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  final List<Item> items = List.generate(
    12,
    (index) => Item(id: index, title: 'Item $index'),
  );

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final isFavorite = FavoritesManager.isFavorite(item);

        return GestureDetector(
          onTap: () {
            setState(() {
              FavoritesManager.toggleFavorite(item);
            });
          },
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item.title),
                Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
