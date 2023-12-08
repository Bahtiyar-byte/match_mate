import 'package:match_mate/datastore/data_hobby.dart';
import 'package:match_mate/datastore/data_tip.dart';

class Person {

  int id;
  String name;
  String surname;
  String nickname;
  DateTime birthdate;
  String description;
  String imageUrl;
  int distanceMiles = 5;
  List<Tip> subscribedTips = [];

  Person({
    required this.id,
    required this.name,
    required this.surname,
    required this.nickname,
    required this.birthdate,
    required this.description,
    required this.imageUrl,

  }

  );

  int getAge() {
    final currentDate = DateTime.now();
    int age = currentDate.year - birthdate.year;
    if (birthdate.month > currentDate.month ||
        (birthdate.month == currentDate.month &&
            birthdate.day > currentDate.day)) {
      age--;
    }
    return age;
  }




  String imageAsset()
  {
    return "assets/cards/$imageUrl";
  }

  Tip? haveTip(Tip tip) {
    for (Tip t in subscribedTips)
      {
        if (t.name  == tip.name)
          return t;
      }
    return null;
  }

  bool haveHobby(Hobby hobby)
  {
     for (Tip t in subscribedTips)
     {
        if (t.haveHobby(hobby))
        {
          return true;
        }
     }
     return false;
  }

  void subscribeToHobby(Hobby hobby) {
    if (!haveHobby(hobby)) {
      Tip? subscribedTip = haveTip(hobby.tip);

      if (subscribedTip == null) {
        Tip subTip = Tip.copy(hobby.tip);
        subscribedTips.add(subTip);
        subscribedTip = subTip;
      }
      subscribedTip.hobbies.add(hobby);
    }
  }


  void removeHobby(Hobby hobby)
  {
    if (haveHobby(hobby))
    {
      for (Tip t in subscribedTips)
      {
        if (t.haveHobby(hobby))
        {
          t.hobbies.remove(hobby);

          if (t.hobbies.isEmpty)
          {
            subscribedTips.remove(t);
          }
          break;
        }
      }
    }
  }


}