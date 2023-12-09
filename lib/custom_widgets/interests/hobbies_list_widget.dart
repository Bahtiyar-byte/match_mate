import 'package:flutter/material.dart';
import 'package:match_mate/datastore/data_hobby.dart';
import 'package:match_mate/custom_widgets/interests/hobby_item_widget.dart';

class HobbiesListWidget extends StatelessWidget {
  final List<Hobby> hobbies;
  final void Function(Hobby) onHobbySelected;

  HobbiesListWidget({required this.hobbies, required this.onHobbySelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600, // Установите желаемую высоту
      child: ListView.builder(
        itemCount: (hobbies.length / 2).ceil(),
        itemBuilder: (context, blockIndex) {
          int start = blockIndex * 2;
          int end = start + 2;
          if (end > hobbies.length) end = hobbies.length;
          List<Hobby> hobbiesInBlock = hobbies.sublist(start, end);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                childAspectRatio: 1 / 1,
              ),
              itemCount: hobbiesInBlock.length,
              itemBuilder: (context, index) {
                return HobbyItemWidget(hobby: hobbiesInBlock[index], onHobbySelected: onHobbySelected, showBorder: false);
              },
            ),
          );
        },
      ),
    );
  }
}
