import 'package:aqua/app/utils/App_Color/app_color.dart';
import 'package:aqua/app/utils/App_image/app_image.dart';
import 'package:aqua/app/utils/Text_Style/text_Style.dart';
import 'package:aqua/reuse_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Achivment_details_card extends StatelessWidget {
  final String imagePath;
  final String subtitle;
  final String descriptionLine1;
  final String descriptionLine2;
  final VoidCallback onShare;

  const Achivment_details_card({
    super.key,
    required this.imagePath,
    required this.subtitle,
    required this.descriptionLine1,
    required this.descriptionLine2,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40),
        InkWell(
          onTap: (){
            Get.back();
          },
            child: Icon(Icons.cancel_outlined)),
        Center(child: Image(image: AssetImage(imagePath) ,fit: BoxFit.cover,)),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You own', style: AppTextStyles.title26_w600()),
            SizedBox(width: 5),
            Text(
              subtitle,
              style: AppTextStyles.title26_w600(color: AppColor.primarryColor),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('badge', style: AppTextStyles.title26_w600())],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              descriptionLine1,
              style: AppTextStyles.title14_w500(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(descriptionLine2, style: AppTextStyles.title14_w500()),
          ],
        ),
        Spacer(),
        CustomButton(
          onpress:onShare,
          borderRadius: BorderRadius.circular(36),
          title: 'Share',
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
