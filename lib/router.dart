import 'package:go_router/go_router.dart';
import 'package:widgets/screens/contador_screen.dart';
import 'package:widgets/screens/lista_estudiantes_screen.dart';
import 'package:widgets/screens/tarea_pesada_screen.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/ciclo_vida_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
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
  ],
);
