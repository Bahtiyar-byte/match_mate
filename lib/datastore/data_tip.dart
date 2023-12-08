import 'package:flutter/cupertino.dart';
import 'package:match_mate/datastore/data_hobby.dart';
class Tip {
  int id;
  String name;
  String description;
  String imageUrl;

  static double imageSize = 40;

  String imageAsset()
  {
    return "assets/tips/$imageUrl";
  }


  Widget imageSmallWidget() {
    return Image.asset(
      imageAsset(),
      width: Tip.imageSize,
      height: Tip.imageSize,
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Image.asset('assets/default_image.png', width: Tip.imageSize, height: Tip.imageSize);
      },
    );
  }


  List<Hobby> hobbies = [];

  Tip({required this.id, required this.name, required this.description, required this.imageUrl});

  bool haveHobby(Hobby hobby)
  {
      return hobbies.contains(hobby);
  }

  Tip.copy(Tip other)
      : id = other.id,
        name = other.name,
        description = other.description,
        imageUrl = other.imageUrl
        //hobbies = List<Hobby>.from(other.hobbies);
  ;

  void addHobby(Hobby hobby)
  {
    hobby.tip = this;
    hobbies.add(hobby);
  }
}