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

  Person({
    required this.id,
    required this.name,
    required this.surname,
    required this.nickname,
    required this.birthdate,
    required this.description,
    required this.imageUrl,
  });

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

  List<Tip> subscribedTips = [];


  String imageAsset()
  {
    return "assets/cards/$imageUrl";
  }

  Tip? findSubscribedTip(Tip tip)
  {
    try
    {
      return subscribedTips.firstWhere((t) => t == tip);
    }
    catch (e)
    {
      return null;
    }
  }

  void subscribeToTip(Tip tip) {
    if (!subscribedTips.contains(tip)) {
      subscribedTips.add(tip);
    }
  }

  bool haveTip(Tip tip)
  {
    if (tip == null) {
      return false;
    }
      return subscribedTips.contains(tip);
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

  void subscribeToHobby(Hobby hobby)
  {
      if (!haveHobby(hobby))
      {
            Tip? subscribedTip = findSubscribedTip(hobby.tip);
            if (subscribedTip == null)
            {
                subscribedTips.add(hobby.tip);
                subscribedTip = subscribedTips.last;
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