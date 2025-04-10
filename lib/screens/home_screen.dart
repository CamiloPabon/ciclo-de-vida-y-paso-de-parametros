import 'package:flutter/material.dart';
import '../widgets/grid_view_widget.dart';

class BaseView extends StatelessWidget {
  final String title;
  final List<Tab>? tabs;
  final List<Widget>? children;
  final Widget? body;

  const BaseView({
    super.key,
    required this.title,
    this.tabs,
    this.children,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    if (tabs != null && children != null) {
      return DefaultTabController(
        length: tabs!.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            bottom: TabBar(
              isScrollable: true,
              tabs: tabs!),
            
          ),
          body: TabBarView(children: children!),
        ),
      );
    } else if (body != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: body!,
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: const Center(child: Text('Contenido vacío')),
      );
    }
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      body: GridViewWidget(),
    );
  }
}