import 'package:aqua/app/utils/App_image/app_image.dart';
import 'package:flutter/material.dart';

import '../widgets/achivment-detailse_card.dart';

class FristVectory extends StatelessWidget {
  const FristVectory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Achivment_details_card(
          imagePath: achImg.fristVectory,
          subtitle: 'Week Warrior',
          descriptionLine1: 'Congratulations! You’ve logged your first water ',
          descriptionLine2: 'the journey begins!',
          onShare: (){},
        ),
      ),
    );
  }
}
