import 'package:practice1/person.dart';
import 'dart:io';
import 'package:practice1/person_list.dart';

void main() {
  stdout.write('Enter your name:');
  final name = stdin.readLineSync();
  stdout.writeln();
  bool _isRun = true;
  final personList = PersonList();
  while (_isRun) {
    stdout.writeln('Command for this app:');
    stdout.writeln('-Add:');
    stdout.writeln('-Remove:');
    stdout.writeln('-GetInfo:');
    stdout.writeln('-Exit:');

    final command = stdin.readLineSync() ?? '';

    switch (command) {
      case 'Add':
        stdout.writeln('Input age and name for add:');
        final name = stdin.readLineSync() ?? '';
        final int age = int.parse(stdin.readLineSync() ?? '');
        personList.add(name, age);
        break;
      case 'Remove':
        stdout.writeln('Input person id for remove:');
        final int id = int.parse(stdin.readLineSync() ?? '');
        personList.remove(id);
        break;
      case 'GetInfo':
        final int id = int.parse(stdin.readLineSync() ?? '');
        personList.getPersonInfo(id);
        break;
      case 'Exit':
        _isRun = false;
        break;
    }
  }
}
