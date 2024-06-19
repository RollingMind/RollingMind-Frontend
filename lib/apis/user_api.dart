import 'package:dio/dio.dart';
import 'package:rollingmind_front/utils/http.dart';

class UserAPI {
  Future<String> getProfile(String userId) async {
    Dio dio = Dio();
    var response = await dio.get('${Server.http}/$userId');
    return response.data['name'];
  }
}
