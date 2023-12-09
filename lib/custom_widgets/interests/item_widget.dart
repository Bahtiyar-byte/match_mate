// Базовый класс для элементов, связанных с интересами (интерес может быть Tip или Hobby)
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class InterestItemWidget<T> extends StatelessWidget {
  final T interest; // T может быть Tip или Hobby
  final bool isSubscribed;
  final void Function(T) onItemSelected;

  const InterestItemWidget({
    Key? key,
    required this.interest,
    required this.isSubscribed,
    required this.onItemSelected,
  }) : super(key: key);

  Widget buildImage(BuildContext context);
  String get name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onItemSelected(interest),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.blue, width: 2),
          color: isSubscribed ? Colors.lightGreen : Colors.black,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: buildImage(context),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(fontSize: 16, color: isSubscribed ? Colors.black : Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}