import 'package:aqua/app/utils/App_image/app_image.dart';
import 'package:flutter/material.dart';

import '../widgets/achivment-detailse_card.dart';

class WeekWarrior extends StatelessWidget {
  const WeekWarrior({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Achivment_details_card(
          imagePath: achImg.weekly,
          subtitle: 'Frist Victory',
          descriptionLine1: 'Amazing! You’ve stayed hydrated for',
          descriptionLine2: '7 days straight!',
        ),
      ),
    );
  }
}
