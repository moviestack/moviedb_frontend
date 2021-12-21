import 'dart:async';

import 'package:dio/dio.dart';
import 'dart:convert' as convert;

class Database {
  final dio = Dio();
  getAllData() async {
    Timer(Duration(seconds: 2), () {});
    final resp = await dio.get('http://localhost:3000/');
    return resp.data;
  }
}
