class DayData {
  final DayStatus status;
  final double progress;

  DayData({required this.status, required this.progress});
}

enum DayStatus { none, partial, complete, current }