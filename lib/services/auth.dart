import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Auth {
  final dio = Dio();
  login(username, password) async {
    var resp = await dio.post('http://localhost:3000/login',
        data: {"username": username, "password": password});
    return resp.data;
  }

  register(username, password) async {
    var resp = await dio.post('http://localhost:3000/register',
        data: {"username": username, "password": password});
    return resp.data;
  }
}
