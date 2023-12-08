import 'package:flutter/material.dart';
import 'package:match_mate/custom_widgets/person_line_widget.dart';
import 'package:match_mate/datastore/data_person.dart';

class VerticalPersonsListWidget extends StatelessWidget {
  final List<Person> peopleList;

  VerticalPersonsListWidget({required this.peopleList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: peopleList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(peopleList[index].toString()), // Уникальный ключ для Dismissible
            direction: DismissDirection.horizontal, // Разрешить перетаскивание в обе стороны
            onDismissed: (direction) {
              // Действие при "смахивании" элемента
              if (direction == DismissDirection.endToStart) {
                // Действие при смахивании влево
                // Например, можно вызвать функцию для обработки "не нравится"
              } else {
                // Действие при смахивании вправо
                // Например, можно вызвать функцию для обработки "нравится"
              }

              // Удалить элемент из списка (или выполнить другое действие)
               // peopleList.removeAt(index);
            },
            background: Container(color: Colors.red), // Фон при смахивании влево
            secondaryBackground: Container(color: Colors.green), // Фон при смахивании вправо
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              //child: PersonLineWidget(person: peopleList[index]),
                child: PersonLineWidget(person: peopleList[index]),

            ),
          );
        },
      ),
    );
  }
}
