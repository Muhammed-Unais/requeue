abstract class BaseApiService {
  Future<dynamic> getGetApiResponse(String url,String queries);
  Future<dynamic> getPostApiResponse(String url, dynamic body);
}