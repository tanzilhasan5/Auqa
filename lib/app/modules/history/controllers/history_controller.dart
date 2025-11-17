import 'package:get/get.dart';
import '../model/history_model.dart';
class HistoryController extends GetxController {
  final outerList = ["Morning", "Afternoon", "Evening"].obs;

  final innerList = <HistoryModel>[
    HistoryModel(title: "Water", time: "6:50 AM", amount: "300 ml"),
    HistoryModel(title: "Water", time: "9:15 AM", amount: "250 ml"),
    HistoryModel(title: "Water", time: "12:30 PM", amount: "400 ml"),
    HistoryModel(title: "Water", time: "3:20 PM", amount: "300 ml"),
    HistoryModel(title: "Water", time: "5:00 PM", amount: "350 ml"),
  ].obs;
}