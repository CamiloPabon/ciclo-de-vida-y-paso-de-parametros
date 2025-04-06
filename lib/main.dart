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

// Función principal que se ejecuta al inicio de la aplicación.
Future<void> main() async {
  // Asegura que los bindings de Flutter estén inicializados.
  WidgetsFlutterBinding.ensureInitialized();

  // Carga las variables de entorno desde el archivo .env.
  // Asegúrate de que el archivo .env está en la raíz de tu proyecto.
  await dotenv.load(fileName: ".env");

  // Ejecuta la aplicación MyApp.
  runApp(const MyApp());
}

// Widget principal de la aplicación.
class MyApp extends StatelessWidget {
  // Constructor de MyApp.
  const MyApp({super.key});

  // Método que construye el widget de la aplicación.
  @override
  Widget build(BuildContext context) {
    // Retorna un widget MaterialApp que define la estructura básica de la aplicación.
    return MaterialApp(
      // Establece la pantalla principal de la aplicación a MainScreen.
      home: const MainScreen(),
      // Desactiva el banner de modo de depuración.
      debugShowCheckedModeBanner: false,
    );
  }
}

// Widget que representa la pantalla principal de la aplicación.
class MainScreen extends StatelessWidget {
  // Constructor de MainScreen.
  const MainScreen({super.key});

  // Método que construye el widget de la pantalla principal.
  @override
  Widget build(BuildContext context) {
    // Retorna un widget BaseView que contiene el TabBar y el TabBarView.
    return BaseView(
      // Título de la AppBar.
      title: 'Gestión de Funcionalidades',
      // Lista de pestañas para el TabBar.
      tabs: const [
        Tab(icon: Icon(Icons.home), text: 'Inicio'),
        Tab(icon: Icon(Icons.star), text: 'Favoritos'),
        Tab(icon: Icon(Icons.settings), text: 'Ajustes'),
        Tab(icon: Icon(Icons.school), text: 'Estudiantes'),
        Tab(icon: Icon(Icons.calculate), text: 'Contador'),
        Tab(icon: Icon(Icons.work), text: 'Tarea Pesada'),
        Tab(icon: Icon(Icons.emoji_emotions), text: 'Chuck Norris'),
      ],
      // Lista de widgets para el TabBarView.
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

// Widget que representa la pantalla de favoritos.
class FavoriteScreen extends StatelessWidget {
  // Constructor de FavoriteScreen.
  const FavoriteScreen({super.key});

  // Método que construye el widget de la pantalla de favoritos.
  @override
  Widget build(BuildContext context) {
    // Obtiene la lista de favoritos desde el FavoritesManager.
    final favorites = FavoritesManager.favorites;
    // Retorna un widget ListView.builder que muestra la lista de favoritos.
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

// Widget que representa la pantalla de ajustes.
class SettingsScreen extends StatelessWidget {
  // Constructor de SettingsScreen.
  const SettingsScreen({super.key});

  // Método que construye el widget de la pantalla de ajustes.
  @override
  Widget build(BuildContext context) {
    // Retorna un widget Center con un texto de ajustes.
    return const Center(
      child: Text('Ajustes', style: TextStyle(fontSize: 24)),
    );
  }
}

// Definición del enrutador de navegación utilizando GoRouter.
final GoRouter router = GoRouter(
  // Lista de rutas de la aplicación.
  routes: [
    // Ruta para la pantalla de detalles.
    GoRoute(
      // Ruta de acceso (path) con un parámetro dinámico ':id'.
      path: '/detail/:id',
      // Función que construye la pantalla de detalles.
      builder: (context, state) {
        // Convierte el parámetro 'id' a un entero.
        int id = int.parse(state.pathParameters['id']!);
        // Retorna el widget de la pantalla de detalles (DetailScreen) con el ID.
        return DetailScreen(id: id);
      },
    ),
    // Ruta para la pantalla del ciclo de vida.
    GoRoute(
      // Ruta de acceso (path) para la pantalla del ciclo de vida.
      path: '/ciclo_vida',
      // Función que construye la pantalla del ciclo de vida.
      builder: (context, state) {
        // Retorna el widget de la pantalla del ciclo de vida (CicloVidaScreen).
        return CicloVidaScreen();
      },
    ),
    // Ruta para la lista de bromas de Chuck Norris.
    GoRoute(
      // Ruta de acceso (path) para la lista de bromas de Chuck Norris.
      path: '/chucknorris',
      // Función que construye la lista de bromas de Chuck Norris.
      builder: (context, state) {
        // Retorna el widget de la lista de bromas de Chuck Norris (ChucknorrisListView).
        return ChucknorrisListView();
      },
    ),
    // Ruta para los detalles de una broma de Chuck Norris.
    GoRoute(
      // Ruta de acceso (path) con un parámetro dinámico ':id'.
      path: '/chucknorris/:id',
      // Función que construye los detalles de una broma de Chuck Norris.
      builder: (context, state) {
        // Obtiene el ID de los parámetros de la ruta.
        final id = state.pathParameters['id']!;
        // Retorna el widget de los detalles de la broma de Chuck Norris (ChuckNorrisDetailScreen) con el ID.
        return ChuckNorrisDetailScreen(id: id);
      },
    ),
  ],
);