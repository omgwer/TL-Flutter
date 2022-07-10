import 'package:practice1/container/person.dart';
import '../container/person.dart';

class PersonListService {
  final List<Person> _person = <Person>[];
  final Set _personsSet = Set();
  final int arraySize = 100000;

  void add(String name, int age) {
    Person newPerson = Person(name, age, _getCurrentListId());
    _person.add(newPerson);
  }

  bool remove(int id) {
    if (_personsSet.contains(id)) {
      _person.remove(getPersonInfo(id));
      _personsSet.remove(id);
      return true;
    }
    return false;
  }

  Person? getPersonInfo(int id) {
    Person? newPerson;
    for (var element in _person) {
      if (element.id == id) newPerson = element;
    }
    return newPerson;
  }

  getAllPersonInfo() {
    return _person;
  }

  int _getCurrentListId() {
    for (var i = 1; i < arraySize; i++) {
      if (!_personsSet.contains(i)) {
        _personsSet.add(i);
        return i;
      }
    }
    return 0;
  }
}
