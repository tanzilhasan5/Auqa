import 'package:aqua/app/utils/App_Color/app_color.dart';
import 'package:aqua/app/utils/App_image/app_image.dart';
import 'package:aqua/app/utils/Text_Style/text_Style.dart';
import 'package:aqua/reuse_widgets/custom_button.dart';
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
          imagePath: achImg.fristvactor,
          subtitle: 'Perfect Month',
          descriptionLine1: 'Unstoppable! 30 days of perfect hydration',
          descriptionLine2: '— amazing work!',
          onShare: (){},
        ),
      ),
    );
  }
}
