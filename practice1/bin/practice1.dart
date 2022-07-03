import 'package:practice1/service/app_service.dart';

void main() {
  bool _isRun = true;
  AppService.printInfo();

  while (_isRun) {
    final command = AppService.getComand();

    switch (command) {
      case 'add':
        AppService.addPerson();
        break;
      case 'remove':
        AppService.removePerson();
        break;
      case 'getinfo':
        AppService.getPersonInfo();
        break;
      case 'getallinfo':
        AppService.getAllPersonInfo();
        break;
      case 'exit':
        _isRun = false;
        break;
      case 'help':
        AppService.printInfo();
        break;
      default:
        AppService.printInfo();
        break;
    }
  }
}
