import 'package:flutter/material.dart';
import 'package:match_mate/datastore/data_tip.dart';
import 'package:match_mate/datastore/data_hobby.dart';

class HobbiesListWidget extends StatelessWidget {
  final List<Hobby> hobbies;
  final void Function(Hobby) onHobbySelected;

  HobbiesListWidget({required this.hobbies, required this.onHobbySelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600, // Установите желаемую высоту
      child: ListView.builder(
        itemCount: (hobbies.length / 2).ceil(), // Количество блоков советов
        itemBuilder: (context, blockIndex) {
          int start = blockIndex * 2;
          int end = start + 2;
          if (end > hobbies.length) end = hobbies.length;
          List<Hobby> tipsInBlock = hobbies.sublist(start, end);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0), // Отступ между блоками
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Два столбца
                crossAxisSpacing: 6, // Расстояние по ширине между блоками
                mainAxisSpacing: 6, // Расстояние по высоте между блоками
                childAspectRatio: 1 / 1, // Уменьшенное соотношение сторон для каждого блока
              ),
              itemCount: tipsInBlock.length,
              itemBuilder: (context, index) {
                final hobby = tipsInBlock[index];
                return InkWell(
                  onTap: () => onHobbySelected(hobby),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.blue, width: 2),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child:
                            Image.asset(

                                hobby.imageAsset(),
                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                  // Возвращаем изображение по умолчанию, если произошла ошибка
                                  return Image.asset('assets/default_image.png');
                                },
                                fit: BoxFit.cover),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              hobby.name,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
