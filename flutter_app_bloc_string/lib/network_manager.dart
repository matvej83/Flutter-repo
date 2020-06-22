import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'model/postUser.dart';

class NetworkManager {
  Future<PostUsers> fetchUser() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      return PostUsers.fromJson(jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }
}
