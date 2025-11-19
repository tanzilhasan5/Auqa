import 'package:aqua/app/utils/App_image/app_image.dart';
import 'package:flutter/material.dart';

import '../widgets/achivment-detailse_card.dart';

class WeeklyLegend extends StatelessWidget {
  const WeeklyLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Achivment_details_card(
          imagePath: achImg.Legend,
          subtitle: ' Weekly Legend',
          descriptionLine1: 'Consistency Champ! 4 weeks of daily goals',
          descriptionLine2: '— you crushed it!',
          onShare: (){},
        ),
      ),
    );
  }
}
