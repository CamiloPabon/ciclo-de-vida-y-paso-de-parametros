import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:widgets/models/chucknorris.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChuckService {
  Future<List<Chuknoris>> getMultipleChuckNorris(int count) async {
    final List<Chuknoris> chuckNorrisList = [];
    final apiUrl = dotenv.env['API_URL'];

    if (apiUrl == null) {
      throw Exception('API_URL no está configurado en .env');
    }

    for (int i = 0; i < count; i++) {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        chuckNorrisList.add(Chuknoris.fromJson(data));
      } else {
        throw Exception('Failed to load Chuck Norris joke');
      }
    }

    return chuckNorrisList;
  }

  Future<Chuknoris> getChuckNorrisById(String id) async {
    final apiUrl = 'https://api.chucknorris.io/jokes/$id';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Chuknoris.fromJson(data);
    } else {
      throw Exception('Failed to load Chuck Norris joke');
    }
  }
}