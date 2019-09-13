import 'dart:convert';

import 'package:http_logger/http_logger.dart';
import 'package:http_middleware/http_middleware.dart';
import 'package:otaghak_guest/repository/constants.dart';

import 'model/index-response.dart';

const BASE_URL = 'https://api.otaghak.com';

HttpWithMiddleware httpClient = HttpWithMiddleware.build(middlewares: [
  HttpLogger(logLevel: LogLevel.BODY),
]);

Future<IndexResponse> fetchIndex() async {
  final response = await httpClient
      .get('$BASE_URL/home/newmobileindex', headers: {...defaultHeaders});

  if (response.statusCode == 200) {
    return IndexResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}
