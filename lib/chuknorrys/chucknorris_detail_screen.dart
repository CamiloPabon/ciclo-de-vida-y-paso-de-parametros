import 'package:flutter/material.dart';
import 'package:widgets/models/chucknorris.dart';
import 'package:widgets/services/chuck_service.dart';

class ChuckNorrisDetailScreen extends StatefulWidget {
  final String id;

  const ChuckNorrisDetailScreen({super.key, required this.id});

  @override
  State<ChuckNorrisDetailScreen> createState() => _ChuckNorrisDetailScreenState();
}

class _ChuckNorrisDetailScreenState extends State<ChuckNorrisDetailScreen> {
  final ChuckService _chuckService = ChuckService();
  late Future<Chuknoris> _futureChuck;

  @override
  void initState() {
    super.initState();
    _futureChuck = _chuckService.getChuckNorrisById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalles de la Broma')),
      body: FutureBuilder<Chuknoris>(
        future: _futureChuck,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final chuckNorris = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(chuckNorris.icon_url, width: 150, height: 150, fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 16.0),
                  Text(chuckNorris.value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}