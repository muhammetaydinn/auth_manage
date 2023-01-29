import 'package:flutter/foundation.dart';

class UserModel {
  String name;
  String imageUrl;
  UserModel({
    required this.name,
    required this.imageUrl,
  });

  factory UserModel.fake(){
    return UserModel(
        name: "vb",
        imageUrl:
            "https://avatars.githubusercontent.com/u/72871376?s=400&u=91d1407bd4a9b25c0c8671e04cf6362e0b776f00&v=4");
  }
}
