import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.star), text: 'Favoritos'),
              Tab(icon: Icon(Icons.settings), text: 'Ajustes'),
            ],
          ),
          SizedBox(
            height: 100,
            child: TabBarView(
              children: [
                Center(child: Text('Home Tab')),
                Center(child: Text('Favoritos Tab')),
                Center(child: Text('Ajustes Tab')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
