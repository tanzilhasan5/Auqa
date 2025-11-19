/*
import 'package:get/get.dart';
import '../model/model.dart';

class HistoryCalendarController extends GetxController {
  var selectedMonth = DateTime.now().obs;
  var selectedDay = RxnInt();
  var isExpanded = false.obs;

  @override
  void onInit() {
    super.onInit();

    _selectTodayIfPossible();
  }

  void _selectTodayIfPossible() {
    final today = DateTime.now();
    if (selectedMonth.value.year == today.year &&
        selectedMonth.value.month == today.month) {
      selectedDay.value = today.day;
    } else {
      selectedDay.value = null;
    }
  }

  final Map<DateTime, DayData> _dayDataMap = {
    DateTime(2025, 10, 27): DayData(status: DayStatus.partial, progress: 0.6),
    DateTime(2025, 10, 28): DayData(status: DayStatus.partial, progress: 0.8),
    DateTime(2025, 10, 29): DayData(status: DayStatus.complete, progress: 1.0),
    DateTime(2025, 10, 30): DayData(status: DayStatus.partial, progress: 0.4),
    DateTime(2025, 11, 21): DayData(status: DayStatus.partial, progress: 0.7),
    DateTime(2025, 11, 23): DayData(status: DayStatus.partial, progress: 0.9),
    DateTime(2025, 11, 17): DayData(status: DayStatus.partial, progress: 0.5),
  };

  DayData? getDayData(DateTime date) {
    return _dayDataMap[DateTime(date.year, date.month, date.day)];
  }

  void selectDay(int day) {
    selectedDay.value = day;
  }

  void changeMonth(int delta) {
    selectedMonth.value = DateTime(
      selectedMonth.value.year,
      selectedMonth.value.month + delta,
    );
    _selectTodayIfPossible();
  }

  void toggleExpanded() {
    isExpanded.toggle();
  }

  // Helper
  bool isDaySelected(int day, {DateTime? month}) {
    final m = month ?? selectedMonth.value;
    final today = DateTime.now();
    return selectedDay.value == day &&
        m.year == today.year &&
        m.month == today.month;
  }
}
*/
// controllers/history_calendar_controller.dart
import 'package:get/get.dart';
import '../model/model.dart';

class HistoryCalendarController extends GetxController {

  var selectedMonth = DateTime.now().obs;
  var selectedDay = DateTime.now().day.obs;
  var isExpanded = false.obs;

  @override
  void onInit() {
    super.onInit();
    selectedDay.value = DateTime.now().day;
  }

  final Map<DateTime, DayData> _dayDataMap = {
    DateTime(2025, 10, 27): DayData(status: DayStatus.partial, progress: 0.6),
    DateTime(2025, 10, 28): DayData(status: DayStatus.partial, progress: 0.8),
    DateTime(2025, 10, 29): DayData(status: DayStatus.complete, progress: 1.0),
    DateTime(2025, 10, 30): DayData(status: DayStatus.partial, progress: 0.4),
    DateTime(2025, 11, 21): DayData(status: DayStatus.partial, progress: 0.7),
    DateTime(2025, 11, 23): DayData(status: DayStatus.partial, progress: 0.9),
    DateTime(2025, 11, 17): DayData(status: DayStatus.partial, progress: 0.5),
  };

  DayData? getDayData(int year, int month, int day) {
    return _dayDataMap[DateTime(year, month, day)];
  }

  void selectDay(int day) {
    selectedDay.value = day;
  }

  void changeMonth(int delta) {
    final newMonth = DateTime(
      selectedMonth.value.year,
      selectedMonth.value.month + delta,
    );
    selectedMonth.value = newMonth;

    final daysInNewMonth = DateTime(newMonth.year, newMonth.month + 1, 0).day;
    if (selectedDay.value > daysInNewMonth) {
      selectedDay.value = 1;
    }
  }

  void toggleExpanded() => isExpanded.toggle();
}
