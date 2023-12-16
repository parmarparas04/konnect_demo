import 'package:dio/dio.dart';

// ignore: constant_identifier_names
const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "Authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  DioFactory();

  Future<Dio> getDio() async {
    Dio dio = Dio();
    int _timeOut = 60 * 1000;

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON
    };
    dio.options = BaseOptions(
        baseUrl: "",
        connectTimeout: Duration(seconds: _timeOut),
        receiveTimeout: Duration(seconds: _timeOut),
        contentType: APPLICATION_JSON,
        headers: headers);

    return dio;
  }
}
