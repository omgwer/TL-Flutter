import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<String> upload(http.Client httpClient) async {
  final url = 'https://api.github.com/users/defunkt';
  final uri = Uri.parse(url);
  final response = await httpClient.get(uri);
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  final avatarUrl = json['avatar_url'];
  final avatarResponse = await httpClient.get(Uri.parse(avatarUrl));
  final avatarFile = await File('avatar.jpg').create();
  await avatarFile.writeAsBytes(avatarResponse.bodyBytes);

  return 'Ok';
}
