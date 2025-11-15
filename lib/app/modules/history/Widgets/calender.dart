
import 'package:flutter/material.dart';

class DayData {
  final int day;
  final DayStatus status;
  final double progress; // 0.0 to 1.0

  DayData({
    required this.day,
    required this.status,
    this.progress = 0.0,
  });
}

// Day status enum
enum DayStatus {
  none,
  partial,
  complete,
  current,
}

class HistoryCalendar extends StatefulWidget {
  const HistoryCalendar({Key? key}) : super(key: key);

  @override
  State<HistoryCalendar> createState() => _HistoryCalendarState();
}

class _HistoryCalendarState extends State<HistoryCalendar> {
  DateTime selectedMonth = DateTime(2025, 10);

  Map<int, DayData> getDayDataMap() {
    return {
      27: DayData(day: 27, status: DayStatus.none),
      28: DayData(day: 28, status: DayStatus.partial, progress: 0.6),
      29: DayData(day: 29, status: DayStatus.complete, progress: 1.0),
      30: DayData(day: 30, status: DayStatus.partial, progress: 0.8),
      1: DayData(day: 1, status: DayStatus.current, progress: 0.3),
      2: DayData(day: 2, status: DayStatus.partial, progress: 0.5),
      3: DayData(day: 3, status: DayStatus.partial, progress: 0.4),
    };
  }

  void changeMonth(int months) {
    setState(() {
      selectedMonth = DateTime(
        selectedMonth.year,
        selectedMonth.month + months,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        _buildMonthSelector(),
        _buildWeekDays(),
        Expanded(child: _buildCalendarGrid()),
      ],
    );
  }

  Widget _buildMonthSelector() {
    final monthNames = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => changeMonth(-1),
          ),
          Text(
            '${monthNames[selectedMonth.month - 1]} ${selectedMonth.year}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () => changeMonth(1),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekDays() {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: days.map((day) {
          return SizedBox(
            width: 44,
            child: Center(
              child: Text(
                day,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCalendarGrid() {
    final dayDataMap = getDayDataMap();
    final daysInMonth = DateTime(selectedMonth.year, selectedMonth.month + 1, 0).day;
    final firstDayOfMonth = DateTime(selectedMonth.year, selectedMonth.month, 1);
    final startingWeekday = firstDayOfMonth.weekday; // 1 = Monday, 7 = Sunday

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          childAspectRatio: 1,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: startingWeekday - 1 + daysInMonth,
        itemBuilder: (context, index) {
          if (index < startingWeekday - 1) {
            return const SizedBox.shrink();
          }

          final day = index - startingWeekday + 2;
          final dayData = dayDataMap[day];

          return CalendarDay(
            day: day,
            dayData: dayData,
          );
        },
      ),
    );
  }
}

class CalendarDay extends StatelessWidget {
  final int day;
  final DayData? dayData;

  const CalendarDay({
    Key? key,
    required this.day,
    this.dayData,
  }) : super(key: key);

  Color _getBorderColor() {
    if (dayData == null) return Colors.grey.shade300;

    switch (dayData!.status) {
      case DayStatus.none:
        return Colors.grey.shade300;
      case DayStatus.partial:
        return Colors.blue.shade400;
      case DayStatus.complete:
        return Colors.red.shade400;
      case DayStatus.current:
        return Colors.blue.shade400;
    }
  }

  Color _getFillColor() {
    if (dayData == null) return Colors.transparent;

    switch (dayData!.status) {
      case DayStatus.none:
        return Colors.transparent;
      case DayStatus.partial:
        return Colors.blue.shade50;
      case DayStatus.complete:
        return Colors.red.shade50;
      case DayStatus.current:
        return Colors.blue.shade50;
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = _getBorderColor();
    final fillColor = _getFillColor();
    final progress = dayData?.progress ?? 0.0;

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: fillColor,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Progress indicator
          if (progress > 0 && progress < 1)
            CircularProgressIndicator(
              value: progress,
              strokeWidth: 1,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(borderColor),
            ),
          // Day number
          Text(
            '$day',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: dayData?.status == DayStatus.complete
                  ? Colors.red.shade700
                  : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
