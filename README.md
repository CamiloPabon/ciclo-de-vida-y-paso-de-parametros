## Taller Flutter: Navegación, Widgets y Ciclo de Vida
## Este proyecto es una solución para el taller en el que se requieren las siguientes funcionalidades:

# Navegación y paso de parámetros:
Se implementa la navegación utilizando go_router. La aplicación cuenta con rutas para la pantalla principal, una pantalla de ciclo de vida y pantallas para demostrar el paso de parámetros (incluyendo una pantalla de detalle que recibe un parámetro).

# Implementación de widgets personalizados:
Se utilizan varios widgets en la pantalla principal:

# GridView: Muestra una lista dinámica de ítems, los cuales se pueden agregar de forma dinámica mediante un FloatingActionButton.

# TabBar y TabBarView: Permiten organizar el contenido en dos secciones (Grid y Lista).

# FloatingActionButton (FAB): Se utiliza para agregar nuevos ítems al GridView, haciendo la interfaz interactiva y dinámica.

# Evidencia del ciclo de vida de un StatefulWidget:
En la pantalla de ciclo de vida se incluyen print() en los métodos initState(), didChangeDependencies(), build(), setState() y dispose(). Esto permite ver en la consola la secuencia de ejecución de cada uno de estos métodos durante la navegación.

## Estructura del Proyecto
# La estructura de carpetas y archivos es la siguiente:


my_taller_app/
├── android/
├── ios/
├── lib/
│   ├── main.dart
│   ├── routes/
│   │   └── app_router.dart
│   └── views/
│       ├── home_view.dart
│       ├── ciclo_vida/
│       │   └── ciclo_vida_screen.dart
│       └── paso_parametros/
│           ├── paso_parametros_screen.dart
│           └── detalle_screen.dart
├── pubspec.yaml
└── README.md
main.dart

Es el punto de entrada de la aplicación. Aquí se configura el MaterialApp.router utilizando go_router (o se invoca el router definido en app_router.dart).

routes/app_router.dart:
Define las rutas principales de la aplicación, como la pantalla principal (/), la pantalla de ciclo de vida (/ciclo-vida), y las rutas para paso de parámetros (/paso-parametros y /detalle/:param).

views/home_view.dart:
Pantalla principal que integra un TabBar con dos secciones:

Una pestaña con un GridView dinámico (donde se agregan ítems mediante el FAB).

Otra pestaña con un ListView que permite navegar a otras pantallas.

views/ciclo_vida/ciclo_vida_screen.dart:
Pantalla que evidencia el ciclo de vida de un StatefulWidget, con prints en cada uno de los métodos del ciclo de vida. Incluye un botón de retroceso para volver a la pantalla anterior.

views/paso_parametros/:
Contiene dos pantallas:

paso_parametros_screen.dart: Una pantalla de ejemplo para navegar y demostrar el paso de parámetros.

detalle_screen.dart: Muestra el parámetro recibido en la URL y permite volver a la pantalla anterior.

## Cómo Ejecutar el Proyecto
Instalar Flutter:
Asegúrate de tener instalado Flutter. Consulta la documentación oficial para más detalles.

## Clonar el repositorio:
git clone <URL-del-repositorio>
cd my_taller_app
Instalar las dependencias:

flutter pub get
Ejecutar la aplicación:


flutter run

## Navegación y Comportamiento
# Navegación:
Se utiliza context.push() para apilar las rutas (por ejemplo, al ir a la pantalla de Detalle o Ciclo de Vida). Esto permite que el botón de retroceso funcione correctamente mediante context.pop().

# Agregado de Ítems:
El FloatingActionButton en la pantalla principal incrementa dinámicamente una lista de ítems que se muestran en el GridView. Esto hace la aplicación interactiva y demuestra la actualización de estado con setState().

#Ciclo de Vida:
La pantalla de Ciclo de Vida muestra en la consola el orden de ejecución de los métodos propios de un StatefulWidget. Esto sirve para comprender mejor el ciclo de vida en Flutter.
