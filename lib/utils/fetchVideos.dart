import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> getVideos() async {
  final response = await http.get(Uri.parse(
      "https://raw.githubusercontent.com/n3row/Flutter-lab1/main/data/videos.json"));
  print('response ${response.body}');

  if (response.statusCode == 200) {
    final list = (jsonDecode(response.body) as List);
    return list.map((e) => e as Map<String, dynamic>).toList();
  } else {
    throw Exception('Failed to load');
  }
}
