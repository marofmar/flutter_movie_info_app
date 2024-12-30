import 'dart:convert';
import 'package:http/http.dart';
import 'package:movie_info_app/data/core/api_constants.dart';

class ApiClient {
  final Client _client;
  ApiClient(this._client);

  dynamic get(String path) async {
    final response = await _client.get(
        Uri.parse(
            '${ApiConstants.baseUrl}$path?api_key=${ApiConstants.apiKey}'),
        headers: {
          'Authorization': 'Bearer ${ApiConstants.apiKey}',
          'Content-Type': 'application /json;charset=utf-8',
        });
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      print(responseBody);
      return responseBody;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
