import 'package:auth_manager_flutter/core/auth_manager.dart';
import 'package:auth_manager_flutter/home/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/cache_manager.dart';
import '../login/login.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with CacheManager {
  String token = "";
  late UserModel? userModel;

  Future<void> getTokenCache() async {
    token = await getToken() ?? "";
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    userModel = context.read<AuthManager>().model;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${userModel?.name}")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    CircleAvatar(
                        radius: 80,
                        backgroundImage:
                            NetworkImage(userModel?.imageUrl ?? "")),
                    // TextButton(
                    //   onPressed: (() {
                    //     context.read<AuthManager>().removeAllData();
                    //     Navigator.of(context).push(
                    //         MaterialPageRoute(builder: (context) => Login()));
                    //   }),
                    //   child: Text("Cikis yap"),
                    // )
                    //olmadı
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
