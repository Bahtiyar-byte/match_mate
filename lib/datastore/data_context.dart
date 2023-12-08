import 'package:flutter/foundation.dart';
import 'package:match_mate/datastore/data_person.dart';
import 'package:match_mate/datastore/data_hobby.dart';
import 'package:match_mate/datastore/data_tip.dart';

class DataContext extends ChangeNotifier{
  List<Tip> tips = [];
  List<Person> persons = [];
  Person? activePerson;
  Person? user;
  DataContext() {
    activePerson = null;
    user = null;

    notifyListeners();

    initTestData();
  }

  void initTestData()
  {
      initTipsData();
      initPersonsData();
  }

  Person? findPersonByTip(Tip tip) {
        for (var person in persons) {
              if (person.description.toLowerCase().contains(tip.name.toLowerCase())) {
                    return person;
              }
        }
        return null; // Возвращаем null, если не нашли соответствующую персону
  }

  void initTipsData() {

        Tip sports = Tip(
              id: 1,
              name: "Sports",
              description: "Various physical activities and games.",
              imageUrl: "sports.png",
        );
        sports.hobbies = [
              Hobby(id: 1, name: "Football", description: "Team sport with a round ball", imageUrl: "football.png", tip: sports),
              Hobby(id: 2, name: "Basketball", description: "Team sport with a hoop and ball", imageUrl: "basketball.png", tip: sports),
              Hobby(id: 3, name: "Tennis", description: "Court or lawn game played with rackets", imageUrl: "tennis.png", tip: sports),
              Hobby(id: 4, name: "Baseball", description: "Bat-and-ball game", imageUrl: "image_baseball.png", tip: sports),
              Hobby(id: 5, name: "Cycling", description: "Using bicycles for transport or sport", imageUrl: "cycling.png", tip: sports),
              Hobby(id: 6, name: "Swimming", description: "Moving through water using limbs", imageUrl: "swimming.png", tip: sports),
              Hobby(id: 7, name: "Running", description: "Moving rapidly on foot", imageUrl: "running.png", tip: sports),
              Hobby(id: 8, name: "Badminton", description: "Racket sport with a shuttlecock", imageUrl: "badminton.png", tip: sports),
              Hobby(id: 9, name: "Boxing", description: "Combat sport with punches", imageUrl: "boxing.png", tip: sports),
              Hobby(id: 10, name: "Gymnastics", description: "Sport involving physical exercises", imageUrl: "gymnastics.png", tip: sports),
        ];
        tips.add(sports);



        Tip tourism = Tip(
              id: 2,
              name: "Tourism",
              description: "Travel and exploration.",
              imageUrl: "tourism.png",
        );
        tourism.hobbies = [
              Hobby(id: 11, name: "Mountain Hiking", description: "Walking in nature on mountains.", imageUrl: "image_mountain_hiking.png", tip: tourism),
              Hobby(id: 12, name: "Beach Vacations", description: "Relaxing on the beach.", imageUrl: "image_beach_vacation.png", tip: tourism),
              Hobby(id: 13, name: "Cultural Exploration", description: "Exploring different cultures and traditions.", imageUrl: "image_cultural_exploration.png", tip: tourism),
              Hobby(id: 14, name: "Cruise Trips", description: "Traveling by ship.", imageUrl: "image_cruise.png", tip: tourism),
              Hobby(id: 15, name: "Backpacking", description: "Traveling with a backpack.", imageUrl: "image_backpacking.png", tip: tourism),
              Hobby(id: 16, name: "Safari", description: "Adventure trip to observe wildlife.", imageUrl: "image_safari.png", tip: tourism),
              Hobby(id: 17, name: "City Tours", description: "Exploring major attractions in a city.", imageUrl: "image_city_tour.png", tip: tourism),
              Hobby(id: 18, name: "Island Hopping", description: "Visiting several islands.", imageUrl: "image_island_hopping.png", tip: tourism),
              Hobby(id: 19, name: "Diving", description: "Underwater exploration.", imageUrl: "image_diving.png", tip: tourism),
              Hobby(id: 20, name: "Camping", description: "Staying outdoors in a tent.", imageUrl: "image_camping.png", tip: tourism),
        ];
        tips.add(tourism);


        Tip art = Tip(
              id: 3,
              name: "Art",
              description: "Appreciation and creation of visual and performing art.",
              imageUrl: "art.png",
        );
        tips.add(art);


        Tip gardening = Tip(
              id: 4,
              name: "Gardening",
              description: "Planting and nurturing of plants and flowers.",
              imageUrl: "gardening.png",
        );
        tips.add(gardening);


        Tip cooking = Tip(
              id: 5,
              name: "Cooking",
              description: "Preparing and making various dishes.",
              imageUrl: "cooking.png",
        );
        tips.add(cooking);

        Tip reading = Tip(
              id: 6,
              name: "Reading",
              description: "Exploring the world of literature.",
              imageUrl: "reading.png",
        );
        tips.add(reading);


        Tip pets = Tip(
              id: 7,
              name: "Pets",
              description: "Caring for and enjoying the company of animals.",
              imageUrl: "pets.png",
        );
        tips.add(pets);


        Tip hunting = Tip(
              id: 8,
              name: "Hunting",
              description: "Pursuing and capturing game.",
              imageUrl: "hunting.png",
        );
        tips.add(hunting);

        Tip museums = Tip(
              id: 9,
              name: "Museums",
              description: "Exploring history and culture through exhibits.",
              imageUrl: "museums.png",
        );
        tips.add(museums);


        Tip collecting = Tip(
              id: 10,
              name: "Collecting",
              description: "Gathering items based on a particular theme or interest.",
              imageUrl: "collecting.png",
        );
        tips.add(collecting);

        Tip games = Tip(
              id: 10,
              name: "Games",
              description: "Games.",
              imageUrl: "games.png",
        );
        tips.add(games);

        Tip cinema = Tip(
              id: 10,
              name: "Cinema",
              description: "Cinema.",
              imageUrl: "cinema.png",
        );
        tips.add(cinema);
  }

  void initPersonsData() {


        Person alice = Person(
              id: 1,
              name: "Alice",
              surname: "Smith",
              nickname: "Ali",
              birthdate: DateTime(1990, 5, 10),
              description: "Alice loves to travel and explore new places.",
              imageUrl: "1.jpeg",
        );

        alice.subscribeToHobby(tips[0].hobbies[0]);
        alice.subscribeToHobby(tips[0].hobbies[2]);
        alice.subscribeToHobby(tips[1].hobbies[0]);

        persons = [];

        // Person 1: Alice Smith
        user = Person(
              id: 0,
              name: "Bahtiyar",
              surname: "Haydarov",
              nickname: "Brandon",
              birthdate: DateTime(1986, 5, 10),
              description: "Brandon loves to coding.",
              imageUrl: "0.jpeg",
        );

        alice.subscribeToHobby(tips[0].hobbies[0]);
        alice.subscribeToHobby(tips[0].hobbies[2]);
        alice.subscribeToHobby(tips[1].hobbies[0]);

        persons.add(alice);

        // Person 2: Bob Johnson
        Person bob = Person(
              id: 2,
              name: "Bob",
              surname: "Johnson",
              nickname: "Bobby",
              birthdate: DateTime(1985, 3, 15),
              description: "Bob is passionate about football and sports in general.",
              imageUrl: "2.jpeg",
        );
        persons.add(bob);


        // Person 3: David Brown
        Person david = Person(
              id: 3,
              name: "David",
              surname: "Brown",
              nickname: "Dave",
              birthdate: DateTime(1987, 10, 30),
              description: "David is a foodie and loves cooking new recipes.",
              imageUrl: "3.jpeg",
        );
        persons.add(david);

        // Person 4: Carol Williams
        Person carol = Person(
              id: 4,
              name: "Carol",
              surname: "Williams",
              nickname: "Caz",
              birthdate: DateTime(1992, 8, 20),
              description: "Carol is an art lover and enjoys visiting museums.",
              imageUrl: "4.jpeg",
        );
        persons.add(carol);



        // Person 6: Eva Jones
        Person eva = Person(
              id: 6,
              name: "Eva",
              surname: "Jones",
              nickname: "Evie",
              birthdate: DateTime(1995, 1, 5),
              description: "Eva enjoys gardening and has a green thumb.",
              imageUrl: "6.jpeg",
        );
        persons.add(eva);

        // Person 5: Frank Davis
        Person frank = Person(
              id: 5,
              name: "Frank",
              surname: "Davis",
              nickname: "Frankie",
              birthdate: DateTime(1982, 6, 25),
              description: "Frank is a pet lover and has two cats.",
              imageUrl: "5.jpeg",
        );
        persons.add(frank);

        // Person 8: Grace Wilson
        Person grace = Person(
              id: 8,
              name: "Grace",
              surname: "Wilson",
              nickname: "Gracie",
              birthdate: DateTime(1998, 4, 15),
              description: "Grace loves reading and has a vast book collection.",
              imageUrl: "8.jpeg",
        );
        persons.add(grace);

        // Person 7: Harry White
        Person harry = Person(
              id: 7,
              name: "Harry",
              surname: "White",
              nickname: "H",
              birthdate: DateTime(1989, 12, 10),
              description: "Harry is into trekking and loves mountain hikes.",
              imageUrl: "7.jpeg",
        );
        persons.add(harry);

        // Person 10: Isabelle Miller
        Person isabelle = Person(
              id: 10,
              name: "Isabelle",
              surname: "Miller",
              nickname: "Izzy",
              birthdate: DateTime(2000, 7, 30),
              description: "Isabelle is a collector and loves antiques.",
              imageUrl: "10.jpeg",
        );
        persons.add(isabelle);

        // Person 9: James Taylor
        Person james = Person(
              id: 9,
              name: "James",
              surname: "Taylor",
              nickname: "Jamie",
              birthdate: DateTime(1979, 2, 22),
              description: "James is an avid hunter and loves outdoor activities.",
              imageUrl: "9.jpeg",
        );
        persons.add(james);


  }




}