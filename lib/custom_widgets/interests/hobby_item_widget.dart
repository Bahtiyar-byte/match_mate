import 'package:flutter/material.dart';
import 'package:match_mate/datastore/data_hobby.dart';
import 'package:provider/provider.dart';
import '../../datastore/data_context.dart';

class HobbyItemWidget extends StatelessWidget {
  final Hobby hobby;
  final void Function(Hobby) onHobbySelected;
  final bool showBorder; // Параметр для управления видимостью рамки
  final double padding; // Параметр для управления отступом

  HobbyItemWidget({
    required this.hobby,
    required this.onHobbySelected,
    this.showBorder = true, // по умолчанию рамка будет показываться
    this.padding = 20.0, // по умолчанию отступ в 20 пикселей
  });

  @override
  Widget build(BuildContext context) {
    final dataContext = Provider.of<DataContext>(context);
    final isSubscribed = dataContext.user?.haveHobby(hobby) ?? false;

    return Padding(
      padding: EdgeInsets.all(padding), // Применение заданного отступа
      child: InkWell(
        onTap: () {
          if (isSubscribed) {
            dataContext.user?.removeHobby(hobby);
          } else {
            dataContext.user?.subscribeToHobby(hobby);
          }
          dataContext.notifyListeners(); // Обновляем UI
          onHobbySelected(hobby); // Дополнительные действия при нажатии
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: showBorder // Условие для показа или скрытия рамки
                ? Border.all(color: Colors.blue, width: 2)
                : null, // Нет рамки
            color: isSubscribed ? Colors.lightGreen : null, // Изменено здесь
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    hobby.imageAsset(),
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
                    hobby.name,
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

