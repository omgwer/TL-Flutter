import 'package:practice1/person.dart';
import 'person.dart';

class PersonList {
  final _person = <Person>[];

  void add(String name, int age) {
    Person newPerson = Person(name, age, getCurrentListId());
    _person.add(newPerson);
  }

  void remove(int id) {}

  Person? getPersonInfo(int id) {
    Person? newPerson;
    _person.forEach((element) {
      if (element.id == id) newPerson = element;
    });
    return newPerson;
  }

  int getCurrentListId() {
    return _person.length + 1;
  }
}
