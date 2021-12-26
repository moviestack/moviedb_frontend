import 'package:dio/dio.dart';

class Database {
  final dio = Dio();
  getAllData(int mId) async {
    final resp = await dio.get(
      'http://localhost:3000/getMovieDetails',
      queryParameters: {'m_id': mId},
    );
    return resp.data[0];
  }

  getMovieList() async {
    final resp = await dio.get('http://localhost:3000/');
    return resp.data;
  }
}
