import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets/models/chucknorris.dart';
import 'package:widgets/screens/home_screen.dart';
import 'package:widgets/services/chuck_service.dart';

class ChucknorrisListView extends StatefulWidget {
  const ChucknorrisListView({super.key});

  @override
  State<ChucknorrisListView> createState() => _ChucknorrisListViewState();
}

class _ChucknorrisListViewState extends State<ChucknorrisListView> {
  final ChuckService _chuckService = ChuckService();
  late Future<List<Chuknoris>> _futureChuckList;

  @override
  void initState() {
    super.initState();
    _futureChuckList = _chuckService.getMultipleChuckNorris(10);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Bromas de Chuck Norris',
      body: FutureBuilder<List<Chuknoris>>(
        future: _futureChuckList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final chuckNorrisList = snapshot.data!;
            return ListView.builder(
              itemCount: chuckNorrisList.length,
              itemBuilder: (context, index) {
                final chuckNorris = chuckNorrisList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      context.push('/chucknorris/${chuckNorris.id}');
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.network(chuckNorris.icon_url, width: 80, height: 80, fit: BoxFit.cover),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(chuckNorris.value.toUpperCase(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
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