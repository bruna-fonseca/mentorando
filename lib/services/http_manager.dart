import 'package:dio/dio.dart';

abstract class HttpMethod {
  static const String post = "POST";
  static const String get = "GET";
  static const String delete = "DELETE";
  static const String put = "PUT";
}

class HttpManager {
  Future<Map> restRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body,
}) async {
    // headers
    final defaultHeaders = headers?.cast<String, String>() ?? {}
    ..addAll({
      'content-type': 'application/json',
      'accept': 'application/json',
      'X-Parse-Application-Id': 'NVbpT3b3w5ctnBUrH1PVyAFBOhc6LEt2Tb0iHYaL',
      'X-Parse-REST-API-Key': '26JGCsyaHLhBarhye04CJmOnyXCEcs9t1MbNNmRx',
    });

    Dio dio = Dio();

    try {
      Response response = await dio.request(
        url,
        options: Options(
            headers: defaultHeaders,
            method: method
        ),
        data: body,
      );

      return response.data;

    } on DioException catch(error) {
      return error.response?.data ?? {};

    } catch (error){
      return {};
    }
  }
}