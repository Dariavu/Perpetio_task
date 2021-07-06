import 'dart:convert';

import 'package:perpetio_task/model/post_model.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static Future<List<PostModel>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      List<dynamic> responseList = jsonDecode(response.body);
      List<PostModel> posts = responseList
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
