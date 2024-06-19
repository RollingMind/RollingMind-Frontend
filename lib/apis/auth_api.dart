import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rollingmind_front/utils/http.dart';
import 'package:rollingmind_front/utils/response.dart';

class AuthAPI {
  Future<CustomResponse> login(String id, String password) async {
    Dio dio = Dio();

    try {
      var body = json.encode({'userId': id, 'password': password});

      var response = await dio.post(
        "${Server.http}/login",
        data: body,
      );

      const storage = FlutterSecureStorage();
      await storage.write(key: 'userId', value: id);

      if (response.statusCode != 200) {
        return CustomResponse(isSuccess: false, message: '로그인 실패');
      }

      return CustomResponse(isSuccess: true, message: '로그인 성공');
      
    } catch (e) {
      debugPrint(e.toString());
      return CustomResponse(isSuccess: false, message: e.toString());
    }
  }
}
