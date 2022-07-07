import 'dart:io';

void main(List<String> arguments) {
  final String res = "https://www.travelline.ru"; //arguments.first;
  final siteName = parseAddresToName(res);
}

String parseAddresToName(String address) {
  String result = address.replaceAll(RegExp('[/.]'), '-');
  result = result.replaceAll(RegExp('https:'), '');
  final pos = result.lastIndexOf('?');
  result = (pos != -1) ? result.substring(0, pos) : result;
  while (result[0] == '-') {
    result = result.substring(1, result.length);
  }
  return result;
}

Future<void> createFolder(String path, String folderName) async {
  Directory root = Directory('$path$folderName');
  await root.create(recursive: false);
}
