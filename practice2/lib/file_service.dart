import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import 'dart:io';

class FileService {
  var _httpClient;
  Directory _directoryRoot = Directory.current;
  String _directoryName = '';
  var _response = null;

  FileService() {
    _httpClient = http.Client();
  }

  Future<String> upload(String url) async {
    await _initData(url);
    _uploadHtml(url);
    _uploadJs(url);
    _uploadCss(url);
    return 'Success';
  }

  Future _initData(String url) async {
    _directoryName = url.replaceFirst('https://', '').replaceAll('/', '');
    _directoryRoot =
        await Directory('./download/$_directoryName').create(recursive: false);
    final Uri uri = Uri.parse(url);
    _response = await _httpClient.get(uri);
  }

  void _uploadHtml(String url) async {
    final File indexHtml =
        await File('./download/$_directoryName/index.html').create();
    await indexHtml.writeAsBytes(_response.bodyBytes);
  }

  void _uploadJs(String url) async {
    final Directory jsDirectory =
        await Directory('./download/$_directoryName/js').create();
    final Document document = parse(_response.body);
    List<Element> jsElements = document.querySelectorAll('script');
    jsElements.removeWhere((element) => element.attributes['src'] == null);
    int i = 0;
    jsElements.forEach((element) async {
      String jsName = '';
      String jsSrc = element.attributes['src'] as String;
      Uri jsUri = Uri.parse('');

      if (jsSrc[0] == '/') {
        jsUri = Uri.parse('$url$jsSrc');
      } else {
        jsUri = Uri.parse(url);
      }
      jsName = '$i';
      i++;
      final responseJs = await _httpClient.get(jsUri);
      final File jsFile =
          await File('./download/$_directoryName/js/$jsName.js').create();
      await jsFile.writeAsBytes(responseJs.bodyBytes);
    });
  }

  void _uploadCss(String url) {
    // доделать
  }
}
