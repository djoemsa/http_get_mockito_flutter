import 'dart:convert';
import 'package:mockito/annotations.dart';

import 'package:http/http.dart' as http;
import 'person.dart';

class PersonServices {
  static Future<Person> getPersonById(String id, http.Client client) async {
    var response = await client.get(Uri.parse('https://anywhere.io/$id'));
    if (response.statusCode != 200) {
      throw Exception("Error");
    }
    var result = json.decode(response.body);

    return Person.fromJson(result);
  }
}

@GenerateMocks([http.Client])
void main() {}
