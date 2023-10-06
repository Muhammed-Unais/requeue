abstract class BaseApiService {
  Future<dynamic> getGetApiResponse(String basseurl, String endpoints,
      Map<String, dynamic>? queryParameters, Map<String, String>? headers);
  Future<dynamic> getPostApiResponse(String url, dynamic body);
}
