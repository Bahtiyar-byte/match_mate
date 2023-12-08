import 'package:flutter/cupertino.dart';
import 'package:match_mate/datastore/data_tip.dart';

class Hobby {
  int id;

  String name;
  String description;
  String imageUrl;

  static double imageSize = 40;
  Widget imageSmallWidget() {
    return Image.asset(
      imageAsset(),
      width: Hobby.imageSize,
      height: Hobby.imageSize,
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Image.asset('assets/default_image.png', width: Hobby.imageSize, height: Hobby.imageSize);
      },
    );
  }

  String imageAsset()
  {
    return "assets/hobbies/$imageUrl";
  }

  Tip tip;

  Hobby({required this.id, required this.name, required this.description, required this.imageUrl, required this.tip});
}