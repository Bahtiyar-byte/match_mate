import 'package:flutter/material.dart';
import 'package:match_mate/datastore/data_person.dart';
import 'package:match_mate/custom_widgets/mates_top_list_notifier.dart';
import 'package:provider/provider.dart';

class MatesTopListWidget extends StatelessWidget {
  final List<Person> people;
  final ScrollController _controller = ScrollController();

  MatesTopListWidget({required this.people});

  @override
  Widget build(BuildContext context) {
    return Consumer<MatesTopListNotifier>(
      builder: (context, storyNotifier, child) {
        return SizedBox(
          height: 120,
          child: ListView.builder(

            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: people.length,
            itemBuilder: (context, index) {
              final person = people[index];
              final isSelected = person == storyNotifier.selectedPerson;

              return GestureDetector(
                onTap: () {
                  storyNotifier.selectPerson(person);
                  _scrollToCenter(context, index);
                },
                child: Column(
                  children: [
                    Container(
                      width: 98,
                      height: 98,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          if (isSelected)
                            Container(
                              width: 98,
                              height: 98,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.blueGrey,
                                  width: 3.0,
                                ),
                              ),
                            ),
                          Container(
                            width: 88,
                            height: 88,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white24,
                                width: 3.0,
                              ),
                            ),
                          ),
                          Container(
                            width: 82,
                            height: 82,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(person.imageAsset()),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      person.name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: isSelected ? Colors.yellowAccent : Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _scrollToCenter(BuildContext context, int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final personWidth = 98.0 + 16.0; // Width of person widget + margin
    final offset = (index * personWidth) - (screenWidth / 2) + (personWidth / 2);

    _controller.animateTo(
      offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:match_mate/datastore/data_person.dart';
import 'package:match_mate/custom_widgets/story_notifier.dart';

class StoryWidget extends StatelessWidget {
  final List<Person> people;
  final ScrollController _controller = ScrollController();

  StoryWidget({required this.people});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Consumer<StoryNotifier>(
        builder: (context, storyNotifier, child) {
          return ListView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: people.length,
            itemBuilder: (context, index) {
              final person = people[index];
              final isSelected = person == storyNotifier.selectedPerson;
              return GestureDetector(
                onTap: () {
                  storyNotifier.selectPerson(person); // Выбираем объект
                  _scrollToCenter(context, index);
                },
                child: Column(
                  children: [
                    Container(
                      width: 98,
                      height: 98,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          if (isSelected) // Если выбран, показываем синий бордер
                            Container(
                              width: 98,
                              height: 98,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.blueGrey,
                                  width: 3.0,
                                ),
                              ),
                            ),
                          Container(
                            width: 88,
                            height: 88,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white24,
                                width: 3.0,
                              ),
                            ),
                          ),
                          Container(
                            width: 82,
                            height: 82,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(person.imageAsset()),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      person.name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: isSelected ? Colors.yellowAccent : null, // Цвет текста при выделении
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _scrollToCenter(BuildContext context, int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final personWidth = 98.0 + 16.0;
    final offset = (index * personWidth) - (screenWidth / 2) + (personWidth / 2);
    _controller.animateTo(offset, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
*/