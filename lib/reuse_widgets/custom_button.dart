import 'package:aqua/app/utils/Text_Style/text_Style.dart';
import 'package:flutter/material.dart';

import '../app/utils/App_Color/app_color.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.title, this.onpress, this.isLoading = false, this.colors, this.borderRadius});
  final String? title;
  final Color? colors;
  final Function()? onpress;
  final bool isLoading;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius:borderRadius?? BorderRadius.circular(36),
        ),
        backgroundColor: colors ?? AppColor.primarryColor,
        minimumSize: const Size(355, 50),
        maximumSize: Size.infinite,
      ),
      onPressed: onpress,
      child: Text(title ??"", style: AppTextStyles.title14_w500(color: AppColor.cardcolor)),
    );
  }
}
