import 'package:flutter/material.dart';
import 'package:match_mate/datastore/data_tip.dart';
import 'package:match_mate/custom_widgets/tip_item_widget.dart';

class TipsListWidget extends StatelessWidget {
  final List<Tip> tips;
  final void Function(Tip) onTipSelected;


  TipsListWidget({required this.tips, required this.onTipSelected});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: (tips.length / 2).ceil(), // Количество блоков советов
        itemBuilder: (context, blockIndex) {
          int start = blockIndex * 2;
          int end = start + 2;
          if (end > tips.length) end = tips.length;
          List<Tip> tipsInBlock = tips.sublist(start, end);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0), // Отступ между блоками
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Два столбца
                crossAxisSpacing: 25, // Расстояние по ширине между блоками
                mainAxisSpacing: 30, // Расстояние по высоте между блоками
                childAspectRatio: 1 / 1, // Уменьшенное соотношение сторон для каждого блока
              ),
              itemCount: tipsInBlock.length,
              itemBuilder: (context, index) {
                return TipItemWidget(tip: tipsInBlock[index], onTipSelected: onTipSelected);
              },
            ),
          );
        },
      ),
    );
  }
}
