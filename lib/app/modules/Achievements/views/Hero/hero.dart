import 'package:aqua/app/utils/App_Color/app_color.dart';
import 'package:aqua/app/utils/App_image/app_image.dart';
import 'package:aqua/app/utils/Text_Style/text_Style.dart';
import 'package:aqua/reuse_widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../widgets/achivment-detailse_card.dart';

class Hero extends StatelessWidget {
  const Hero({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Achivment_details_card(
          imagePath: achImg.fristvactor,
          subtitle: '50L Hero',
          descriptionLine1: 'Awesome Work! 50 liters of pure',
          descriptionLine2: 'consistency — well done!',
          onShare: (){},
        ),
      ),
    );
  }
}
