import 'package:equatable/equatable.dart';

class Person extends Equatable {
  final String id;
  final String name;
  final String age;

  Person({required this.id, required this.name, required this.age});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'].toString(),
      name: json['name'],
      age: json['age'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, age];
}
