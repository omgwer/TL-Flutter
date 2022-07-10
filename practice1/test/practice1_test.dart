import 'dart:math';

import 'package:practice1/container/person.dart';
import 'package:practice1/service/person_list_service.dart';
import 'package:test/test.dart';

void main() {
  test('add person test', () {
    var _personList = PersonListService();
    _personList.add('test', 12);
    _personList.add('test1', 13);
    List<Person> expRes = _personList.getAllPersonInfo();
    expect(expRes[0].age, 12);
    expect(expRes[0].name, 'test');
    expect(expRes[0].id, 1);
    expect(expRes[1].age, 13);
    expect(expRes[1].name, 'test1');
    expect(expRes[1].id, 2);
  });
}
