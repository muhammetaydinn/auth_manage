// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

import '../home/model/user_model.dart';
import 'cache_manager.dart';

class AuthManager extends CacheManager {
  BuildContext context;
  AuthManager({
    required this.context,
  }) {
    fetchUserLogin();
  }

  bool? isLogin = false;
  UserModel? model;

  Future<void> fetchUserLogin() async {
    final token = await getToken();
    if (token != null) {
      isLogin = true;
    }
  }
  //olmadı
  // void removeAllData() {
  //   isLogin = null;
  //   model = null;
  // }
}
