// features/reminders/model/reminder_model.dart
class ReminderModel {
  String time;
  List<String> days;
  bool isActive;

  ReminderModel({
    required this.time,
    required this.days,
    required this.isActive,
  });

  // For unique key in Dismissible
  String get uniqueKey => time + days.join();
}