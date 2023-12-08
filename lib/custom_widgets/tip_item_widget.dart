import 'package:flutter/material.dart';
import 'package:match_mate/datastore/data_tip.dart';

class TipItemWidget extends StatelessWidget {
  final Tip tip;
  final void Function(Tip) onTipSelected;

  TipItemWidget({required this.tip, required this.onTipSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTipSelected(tip),
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
                child: Image.asset(
                    tip.imageAsset(),
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
                  tip.name,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
