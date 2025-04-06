import 'package:go_router/go_router.dart';
import 'package:widgets/screens/detail_screen.dart';
import 'package:widgets/screens/ciclo_vida_screen.dart';
import 'package:widgets/chuknorrys/chucknorris_detail_screen.dart';
import 'package:widgets/chuknorrys/chuk_list_view.dart';

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