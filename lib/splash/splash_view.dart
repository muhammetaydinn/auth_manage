import 'package:auth_manager_flutter/core/auth_manager.dart';
import 'package:auth_manager_flutter/home/home_view.dart';
import 'package:auth_manager_flutter/home/model/user_model.dart';
import 'package:auth_manager_flutter/login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> controlToApp() async {
    await context.read<AuthManager>().fetchUserLogin();
    if (readAuthManager.isLogin ?? false) {
      Future.delayed(Duration(seconds: 1));
      readAuthManager.model = UserModel.fake();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeView()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Login()));
    }
  }

  AuthManager get readAuthManager => context.read<AuthManager>();
  @override
  void initState() {
    super.initState();
    controlToApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
