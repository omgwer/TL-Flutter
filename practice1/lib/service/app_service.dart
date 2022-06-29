import 'dart:io';
import 'package:practice1/container/person.dart';
import 'package:practice1/service/person_list_service.dart';

class AppService {
  static final _personList = PersonListService();

  static void printInfo() {
    stdout.writeln('Command for this app:');
    stdout.writeln('  -Add');
    stdout.writeln('  -Remove');
    stdout.writeln('  -GetInfo');
    stdout.writeln('  -Exit');
    stdout.writeln();
  }

  static String getComand() {
    stdout.write('Input command --> ');
    return _getFormatString(stdin.readLineSync() ?? '');
  }

  static void addPerson() {
    stdout.writeln('Input age and name for add:');
    final name = stdin.readLineSync() ?? '';
    final int age = int.parse(stdin.readLineSync() ?? '');
    if (_validateAge(age)) {
      _personList.add(name, age);
    } else {
      stdout.writeln('Error with add Person! Person age > 0 and < 100');
    }
  }

  static void removePerson() {
    stdout.writeln('Input person id for remove:');
    final int id = int.parse(stdin.readLineSync() ?? '');
    _personList.remove(id);
    stdout.writeln('Person with id = $id removed');
  }

  static void getPersonInfo() {
    stdout.writeln('Input person id for get person information:');
    final int id = int.parse(stdin.readLineSync() ?? '');
    if (id > 0) {
      Person? person = _personList.getPersonInfo(id);
      if (person != null) {
        stdout.writeln('Person name = ${person.name}');
        stdout.writeln('Person age = ${person.age} \n');
      }
    } else {
      stdout.writeln('Person id is not valid');
    }
  }

  static String _getFormatString(String newString) {
    return newString == '' ? '' : newString.trim().toLowerCase();
  }

  static bool _validateAge(int newInt) {
    return newInt > 0 && newInt <= 99 ? true : false;
  }

  static bool _validateString(String newString) {
    return newString == '' ? false : true;
  }
}
