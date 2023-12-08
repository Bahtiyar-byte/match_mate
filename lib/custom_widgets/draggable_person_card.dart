import 'package:flutter/material.dart';
import 'package:match_mate/custom_widgets/person_line_widget.dart';
import 'package:match_mate/datastore/data_person.dart';
import 'dart:math' as math;

class DraggablePersonCard extends StatefulWidget {
  final Person person;
  final Function onDismissed;

  DraggablePersonCard({required this.person, required this.onDismissed});

  @override
  _DraggablePersonCardState createState() => _DraggablePersonCardState();
}

class _DraggablePersonCardState extends State<DraggablePersonCard> {
  double dragStartX = 0.0;
  double currentDragX = 0.0;

  @override
  Widget build(BuildContext context) {
    double rotation = currentDragX / MediaQuery.of(context).size.width * 0.4; // Настройте коэффициент поворота
    return GestureDetector(
      onHorizontalDragStart: (details) {
        dragStartX = details.localPosition.dx;
      },
      onHorizontalDragUpdate: (details) {
        setState(() {
          currentDragX += details.primaryDelta!;
        });
      },
      onHorizontalDragEnd: (details) {
        if (currentDragX.abs() > MediaQuery.of(context).size.width * 0.4) { // Настройте порог смахивания
          widget.onDismissed();
        } else {
          setState(() {
            currentDragX = 0.0;
          });
        }
      },
      child: Transform(
        transform: Matrix4.identity()
          ..translate(currentDragX)
          ..rotateZ(-rotation * math.pi / 180), // Преобразование для наклона
        origin: Offset(dragStartX, 50), // Настройте точку поворота
        child: PersonLineWidget(person: widget.person),
      ),
    );
  }
}
