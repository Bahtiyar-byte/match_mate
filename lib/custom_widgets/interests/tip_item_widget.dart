import 'package:flutter/material.dart';
import 'package:match_mate/datastore/data_tip.dart';
import 'package:provider/provider.dart';

import '../../datastore/data_context.dart';

class TipItemWidget extends StatelessWidget {
  final Tip tip;
  final void Function(Tip) onTipSelected;
  final bool showBorder; // параметр для управления видимостью рамки
  final double padding; // параметр для управления отступом

  TipItemWidget({
    required this.tip,
    required this.onTipSelected,
    this.showBorder = true, // по умолчанию рамка будет показываться
    this.padding = 20.0, // по умолчанию отступ в 20 пикселей
  });

  @override
  Widget build(BuildContext context) {
    // Получаем доступ к DataContext
    final dataContext = Provider.of<DataContext>(context);

    final isSubscribed = dataContext.user?.haveTip(tip) != null;

    // Используем Padding для создания отступа вокруг контейнера
    return Padding(
      padding: EdgeInsets.all(padding), // применяем заданный отступ
      child: InkWell(
        onTap: () => onTipSelected(tip),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: showBorder // условие для показа или скрытия рамки
                ? Border.all(color: Colors.blue, width: 2)
                : null, // нет рамки
            color: isSubscribed ? Colors.lightGreen : null, // изменено здесь
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
                      return Image.asset('assets/default_image.png');
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    tip.name,
                    style: TextStyle(fontSize: 16, color: isSubscribed ? Colors.white : Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

