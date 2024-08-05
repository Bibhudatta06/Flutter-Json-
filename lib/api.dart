import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

Future<List<Comment>> fetchComments() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((comment) => Comment.fromJson(comment)).toList();
  } else {
    throw Exception('Failed to load comments');
  }
}
