import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets/utils/favorites_manager.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/ciclo_vida_screen.dart';
import 'screens/lista_estudiantes_screen.dart';
import 'screens/contador_screen.dart';
import 'screens/tarea_pesada_screen.dart';
import 'chuknorrys/chucknorris_detail_screen.dart';
import 'chuknorrys/chuk_list_view.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
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
      builder: (context, state) => CicloVidaScreen(),
    ),
    GoRoute(
      path: '/estudiantes',
      builder: (context, state) => const ListaEstudiantesScreen(),
    ),
    GoRoute(
      path: '/contador',
      builder: (context, state) => const ContadorScreen(),
    ),
    GoRoute(
      path: '/tarea_pesada',
      builder: (context, state) => const TareaPesadaScreen(),
    ),
    GoRoute(
      path: '/chucknorris',
      builder: (context, state) => ChucknorrisListView(),
    ),
    GoRoute(
      path: '/chucknorris/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return ChuckNorrisDetailScreen(id: id);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Gestión de Funcionalidades',
      tabs: const [
        Tab(icon: Icon(Icons.home), text: 'Inicio'),
        Tab(icon: Icon(Icons.star), text: 'Favoritos'),
        Tab(icon: Icon(Icons.settings), text: 'Ajustes'),
        Tab(icon: Icon(Icons.school), text: 'Estudiantes'),
        Tab(icon: Icon(Icons.calculate), text: 'Contador'),
        Tab(icon: Icon(Icons.work), text: 'Tarea Pesada'),
        Tab(icon: Icon(Icons.emoji_emotions), text: 'Chuck Norris'),
      ],
      children: const [
        HomeScreen(),
        FavoriteScreen(),
        SettingsScreen(),
        ListaEstudiantesScreen(),
        ContadorScreen(),
        TareaPesadaScreen(),
        ChucknorrisListView(),
      ],
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