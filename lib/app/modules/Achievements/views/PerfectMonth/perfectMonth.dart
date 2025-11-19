import 'package:aqua/app/utils/App_image/app_image.dart';
import 'package:flutter/material.dart';

import '../widgets/achivment-detailse_card.dart';

class PerfectMonth extends StatelessWidget {
  const PerfectMonth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Achivment_details_card(
          imagePath: achImg.perfect,
          subtitle: 'Perfect Month',
          descriptionLine1: 'Unstoppable! 30 days of perfect hydration',
          descriptionLine2: '— amazing work!',
          onShare: (){},
        ),
      ),
    );
  }
}
