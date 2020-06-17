import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class NetworkManager {
  fetchUser() async {
    var url = 'https://jsonplaceholder.typicode.com/posts/5';

    // Await the http get response, then decode the json-formatted response.
    print(' getting user data for user with id=5...');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var userData = jsonResponse['title'];
      print(' found user data: $userData');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
