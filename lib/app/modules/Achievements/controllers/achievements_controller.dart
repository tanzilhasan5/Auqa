import 'package:aqua/app/utils/App_image/app_image.dart';
import 'package:get/get.dart';

class AchievementsController extends GetxController {
  List<Map<String, String>> people = [
    {
      "progress": "0.2",
      "imagePath": "${achivment.fristVectory}",
      "title": "Frist Victory",
      "subtitle1": "Log your first",
      "subtitle2": "water",

    },
    {
      "progress": "0.5",
      "imagePath": "${achivment.weekly}",
      "title": "Week Warrior",
      "subtitle1": "Complete goals",
      "subtitle2": "7 days in a row",

    },
    {
      "progress": "0.4",
      "imagePath": "${achivment.early}",
      "title": "Early Bird Elite",
      "subtitle1": "Drink before ",
      "subtitle2": "9 AM for 5 days",

    },
    {
      "progress": "0.6",
      "imagePath": "${achivment.perfect}",
      "title": "PerfectMonth",
      "subtitle1": "30 day  ",
      "subtitle2": "Consistency",

    },
    {
      "progress": "0.1",
      "imagePath": "${achivment.Immortal}",
      "title": "Immortal",
      "subtitle1": "Stay hydrated ",
      "subtitle2": "365 days straight",

    },
    {
      "progress": "0.4",
      "imagePath": "${achivment.Hero}",
      "title": "50L Hero",
      "subtitle1": "Drink 50 liters ",
      "subtitle2": "total",

    },

    {
      "progress": "0.3",
      "imagePath": "${achivment.Weekly_Legend}",
      "title": "Weekly Legend",
      "subtitle1": "Hit daily goals ",
      "subtitle2": "for 4 weeks.",

    },
    {
      "progress": "0.8",
      "imagePath": "${achivment.AquaSovereign}",
      "title": "Aqua Sovereign",
      "subtitle1": "Reach 200 total",
      "subtitle2": "goals.",

    },
    {
      "progress": "0.9",
      "imagePath": "${achivment.cool}",
      "title": "Cool Refresher",
      "subtitle1": "Log 10 chilled ",
      "subtitle2": "water intakes",

    },

  ].toList();
}
