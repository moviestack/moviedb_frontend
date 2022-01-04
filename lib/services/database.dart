import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class Database {
  final dio = Dio();
  Future getAllData(int mId) async {
    final resp = await dio.get(
      'http://localhost:3000/getMovieDetails',
      queryParameters: {'m_id': mId},
    );
    return resp.data[0];
  }

  Future getMovieList() async {
    final resp = await dio.get('http://localhost:3000/');
    return resp.data;
  }

  Future searchMovie(title) async {
    final resp = await dio.get('http://localhost:3000/getMovieByTitle',
        queryParameters: {'title': title});
    return resp.data;
  }

  Future handleBrowseRequests(val, index) async {
    late String url;
    late Map<String, dynamic> query;
    switch (index) {
      case '1':
        url = 'http://localhost:3000/getMoviesByLanguage';
        query = {'lang': val};
        break;
      case '2':
        url = 'http://localhost:3000/getMoviesByDirector';
        query = {'dname': val};
        break;
      case '3':
        url = 'http://localhost:3000/minCollection';
        query = {'minCollection': val};
        break;
      case '4':
        url = 'http://localhost:3000/maxCollection';
        query = {'maxCollection': val};
        break;
      case '5':
        url = 'http://localhost:3000/getMoviesByCountry';
        query = {'country': val};
        break;
      case '6':
        url = 'http://localhost:3000/getMoviesByGenre';
        query = {'genre': val};
        break;
      case '7':
        url = 'http://localhost:3000/getMoviesRatedAbove';
        query = {'rating': val};
        break;
      case '8':
        url = 'http://localhost:3000/getMoviesRatedBelow';
        query = {'rating': val};
        break;
      default:
        url = 'http://localhost:3000/getMovieByTitle';
        query = {'title': val};
        break;
    }
    final resp = await dio.get(url, queryParameters: query);
    return resp.data;
  }

  Future addRating(int mId, String uname, double rating) async {
    final resp = await dio.post('http://localhost:3000/addRating', data: {
      "m_id": mId,
      "rating": rating,
      "uname": uname,
    });
    resp.data;
  }

  Future getReviews(int mId) async {
    final box = GetStorage();
    final resp = await dio.get('http://localhost:3000/getReview',
        queryParameters: {"m_id": mId, "uname": box.read('uname')});
    // print(resp.data);
    return resp.data;
  }
}
