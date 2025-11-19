import 'package:aqua/app/utils/App_image/app_image.dart';
import 'package:flutter/material.dart';

import '../widgets/achivment-detailse_card.dart';

class CoolRefresher extends StatelessWidget {
  const CoolRefresher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Achivment_details_card(
          imagePath: achImg.cool,
          subtitle: 'Cool Refresher ',
          descriptionLine1: 'Ice Legend! 10 chilled water intakes — your  ',
          descriptionLine2: 'coolness is unmatched!',
          onShare: (){},
        ),
      ),
    );
  }
}
