import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito_tutorial/person.dart';
import 'package:mockito_tutorial/person_services.dart';
import 'package:http/http.dart' as http;
import 'package:mockito_tutorial/person_services.mocks.dart';

void main() {
  MockClient client = MockClient();

  test("Test Ambil Data", () async {
    String id = '1';
    when(client.get(Uri.parse('https://anywhere.io/$id')))
        .thenAnswer((_) async => Future.value(http.Response('''
    {
      "id": $id,
      "name":"asep",
      "age": "21"
    }
    ''', 200)));
    Person person = await PersonServices.getPersonById(id, client);
    expect(person, Person(id: id, name: "asep", age: "21"));
  });

  test("Test Error", () async {
    String id = '1';
    when(client.get(Uri.parse('https://anywhere.io/$id')))
        .thenAnswer((_) async => Future.value(http.Response('''
    {
      "message": "tidak ada akses"
    }
    ''', 403)));
    expect(PersonServices.getPersonById(id, client), throwsException);
  });
}
