import 'dart:convert';

import 'package:bytebank/http/webclient.dart';
import 'package:http/http.dart';

const MESSEGES_URI = 'https://gist.githubusercontent.com/AyrtonRSPorto/4c97b4139d154c64d30b3a12aef9509b/raw/f47a5a90448924f0a20b6c23aa0e11803ff9bac9/';

class I18NWebClient {
  final String _viewKey;

  I18NWebClient(this._viewKey);

  Future<Map<String, dynamic>> findAll() async {
    final Response response =
    await client.get("$MESSEGES_URI$_viewKey.json");
    final Map<String, dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson;
  }
}