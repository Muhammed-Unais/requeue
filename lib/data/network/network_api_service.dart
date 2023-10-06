import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:requeue/data/app_exceptions.dart';
import 'package:requeue/data/network/base_api_service.dart';

class NetWorkApiService implements BaseApiService {
  @override
  Future getGetApiResponse(
      String basseurl,
      String endpoints,
      Map<String, dynamic>? queryParameters,
      Map<String, String>? headers) async {
    Response? response;

    try {
      final url = Uri.http(basseurl, endpoints, queryParameters);

      response = await http.get(url, headers: headers);

      return returnResponse(response);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future getPostApiResponse(String url, body) async {
    Response? response;
    try {
      var jsonbody = jsonEncode(body);

      response = await http.post(
        Uri.parse(url),
        body: jsonbody,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
      );

      var data = returnResponse(response);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  dynamic returnResponse(Response? response) {
    if (response != null) {
      dynamic message;

      var body = jsonDecode(response.body) as Map<String, dynamic>;

      if (body.containsKey("message")) {
        message = body["message"];
      }

      switch (response.statusCode) {
        case 200:
          return response.body;
        case 400:
          throw BadRequestException(message, response.statusCode);
        case 401:
          throw UnauthorisedException(message, response.statusCode);
        case 403:
          throw UnauthorisedException(message, response.statusCode);
        case 500:
          throw FetchDataException('Something went wrong', response.statusCode);
        default:
          throw FetchDataException(message, response.statusCode);
      }
    } else {
      throw FetchDataException(
        'No internet connection',
      );
    }
  }
}
