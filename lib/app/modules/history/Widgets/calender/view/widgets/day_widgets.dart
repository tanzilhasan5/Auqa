// widgets/calendar_day_widget.dart
import 'package:flutter/material.dart';

import '../../model/model.dart';

class CalendarDayWidget extends StatelessWidget {
  final int day;
  final DayData? dayData;
  final bool isSelected;
  final bool isLarge;

  const CalendarDayWidget({
    Key? key,
    required this.day,
    this.dayData,
    this.isSelected = false,
    this.isLarge = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = dayData?.status ?? DayStatus.none;
    final progress = dayData?.progress ?? 0.0;
    final size = isLarge ? 52.0 : 44.0;

    Color borderColor = Colors.grey.shade300;
    Color fillColor = Colors.transparent;
    Color textColor = Colors.black87;

    if (status == DayStatus.partial || status == DayStatus.current) {
      borderColor = Colors.blue.shade500;
      fillColor = Colors.blue.shade50;
    } else if (status == DayStatus.complete) {
      borderColor = Colors.red.shade500;
      fillColor = Colors.red.shade50;
      textColor = Colors.red.shade700;
    }

    if (isSelected) {
      fillColor = Colors.red;
      borderColor = Colors.red;
      textColor = Colors.white;
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: fillColor,
        border: Border.all(color: isSelected ? Colors.transparent : borderColor, width: 2),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (progress > 0 && progress < 1.0 && !isSelected)
            SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 3,
                backgroundColor: Colors.grey.shade200,
                valueColor: AlwaysStoppedAnimation(borderColor),
              ),
            ),
          Text(
            '$day',
            style: TextStyle(
              fontSize: isLarge ? 17 : 15,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}