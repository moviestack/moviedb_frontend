import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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

  Future addRatingAndReview(
      int mId, String uname, double rating, String review) async {
    final resp =
        await dio.post('http://localhost:3000/addRatingAndReview', data: {
      "m_id": mId,
      "rating": rating,
      "uname": uname,
      "review": review,
    });
    resp.data;
  }

  Future addReview(int mId, String uname, String review_desc) async {
    final resp = await dio.post('http://localhost:3000/addReview', data: {
      "m_id": mId,
      "review": review_desc,
      "uname": uname,
    });
    return resp.data;
  }

  Future getReviews(int mId) async {
    final resp = await dio.get('http://localhost:3000/getAllReviews',
        queryParameters: {"m_id": mId});
    return resp.data;
  }

  Future addMovie(
      String title,
      String plot,
      String year,
      String duration,
      String url,
      String country,
      String production,
      String boxOffice,
      String awards,
      String language,
      String genre,
      String director,
      String rating,
      String review) async {
    final resp =
        await dio.post('http://localhost:3000/add_movie', queryParameters: {
      "title": title,
      "plot": plot,
      "year": year,
      "duration": duration,
      "url": url,
      "country": country,
      "box_office": boxOffice,
      "production": production,
      "awards": awards,
      "language": language,
      "genre": genre,
      "director": director,
      "rating": rating,
      "review_description": review,
    });

    return resp.data;
  }

  Future deleteMovie(title) async {
    final resp = await dio.delete('http://localhost:3000/deleteMovie',
        queryParameters: {"title": title});
    return resp.data;
  }
}
