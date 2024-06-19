import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Future<String?> getCurrentUser() async {
    const storage = FlutterSecureStorage();
    String? userId = await storage.read(key: 'userId');
    return userId;
  }
}

