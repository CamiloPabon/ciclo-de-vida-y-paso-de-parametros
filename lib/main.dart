import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets/utils/favorites_manager.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/ciclo_vida_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Gestión de Favoritos',
      routerConfig: router,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/detail/:id',
      builder: (context, state) {
        int id = int.parse(state.pathParameters['id']!);
        return DetailScreen(id: id);
      },
    ),
    GoRoute(
      path: '/ciclo_vida',
      builder: (context, state) => const CicloVidaScreen(),
    ),
  ],
);

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gestión de Favoritos'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Inicio'),
              Tab(icon: Icon(Icons.star), text: 'Favoritos'),
              Tab(icon: Icon(Icons.settings), text: 'Ajustes'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            HomeScreen(),
            FavoriteScreen(),
            SettingsScreen(),
          ],
        ),
      ),
    );
  }
}

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = FavoritesManager.favorites;
    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final item = favorites[index];
        return ListTile(
          title: Text(item.title),
          onTap: () => context.go('/detail/${item.id}'),
        );
      },
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Ajustes', style: TextStyle(fontSize: 24)),
    );
  }
}
