import 'dart:io';

import 'package:upload_github_avatar/upload_github_avatar.dart'
    as upload_github_avatar;
import 'package:http/http.dart' as http;
import 'package:upload_github_avatar/upload_github_avatar.dart';

Future main(List<String> arguments) async {
  final result = await upload(http.Client());
  stdout.writeln(result);
}
