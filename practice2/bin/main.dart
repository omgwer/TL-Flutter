import '../lib/file_service.dart';
import 'dart:io';

void main() async {
  //String url = arguments.first;
  final url = "https://www.travelline.ru";
  final String result = await FileService().upload(url);
  stdout.writeln(result);
}
