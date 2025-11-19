import 'package:aqua/app/utils/App_Color/app_color.dart';
import 'package:aqua/app/utils/App_image/app_image.dart';
import 'package:aqua/app/utils/Text_Style/text_Style.dart';
import 'package:aqua/reuse_widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../widgets/achivment-detailse_card.dart';

class EarlyBirdElite extends StatelessWidget {
  const EarlyBirdElite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Achivment_details_card(
          imagePath: achImg.early,
          subtitle: 'Early Bird Elite ',
          descriptionLine1: 'Awesome! You’ve started your days the ',
          descriptionLine2: 'right way — hydrated!',
          onShare: (){},
        ),
      ),
    );
  }
}
