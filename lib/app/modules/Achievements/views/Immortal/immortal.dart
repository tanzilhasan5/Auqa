import 'package:aqua/app/utils/App_image/app_image.dart';
import 'package:flutter/material.dart';

import '../widgets/achivment-detailse_card.dart';

class Immortal extends StatelessWidget {
  const Immortal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Achivment_details_card(
          imagePath: achImg.fristvactor,
          subtitle: 'Immortal',
          descriptionLine1: 'Unbelievable! 365 days straight —',
          descriptionLine2: 'dedication is unmatched!',
          onShare: (){},
        ),
      ),
    );
  }
}
