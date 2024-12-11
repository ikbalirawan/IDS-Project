import 'package:dio/dio.dart';

class PictureService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: "https://picsum.photos"),
  );

  Future<List<dynamic>> fetchPictures({int limit = 10, int page = 1}) async {
    final response = await _dio.get('/v2/list', queryParameters: {
      'limit': limit,
      'page': page,
    });
    return response.data;
  }

  Future<Map<String, dynamic>> fetchPictureDetail(String id) async {
    final response = await _dio.get('/id/$id/info');
    return response.data;
  }
}
