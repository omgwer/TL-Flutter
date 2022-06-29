import 'package:practice1/container/person.dart';
import '../container/person.dart';

class PersonListService {
  final _person = <Person>[];

  void add(String name, int age) {
    Person newPerson = Person(name, age, _getCurrentListId());
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

  int _getCurrentListId() {
    return _person.length + 1;
  }
}
