import 'package:match_mate/datastore/data_tip.dart';

class Hobby {
  int id;

  String name;
  String description;
  String imageUrl;

  String imageAsset()
  {
    return "assets/hobbies/$imageUrl";
  }

  Tip tip;

  Hobby({required this.id, required this.name, required this.description, required this.imageUrl, required this.tip});
}