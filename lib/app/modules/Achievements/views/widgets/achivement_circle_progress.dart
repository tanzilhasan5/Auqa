import 'package:aqua/app/routes/app_pages.dart';
import 'package:aqua/app/utils/App_Color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class AchievementProgressCircle extends StatelessWidget {
  final double progress;
  final String imagePath;
  final String title;
  final String subtitle1;
  final String subtitle2;
  final int index;

  const AchievementProgressCircle({
    Key? key,
    required this.progress,
    required this.imagePath,
    required this.title,
    required this.subtitle1,
    required this.subtitle2, required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            Get.toNamed(Routes.frist_vectory);
          break;
          case 1:
            Get.toNamed(Routes.WeekWarrior);
            break;
          case 2:
            Get.toNamed(Routes.EarlyBirdElite);
            break;
          case 3:
            Get.toNamed(Routes.PerfectMonth);
            break;
          case 4:
            Get.toNamed(Routes.Immortal);
            break;
          case 5:
            Get.toNamed(Routes.Hero);
            break;
          case 6:
            Get.toNamed(Routes.WeeklyLegend);
            break;
          case 7:
            Get.toNamed(Routes.AquaSovereign);
            break;
          case 8:
          Get.toNamed(Routes.CoolRefresher);
            break;
          default:
        }
      },
      child: Column(
        children: [
          SizedBox(
            height: 66.h,
            width: 66.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 66.h,
                  width: 66.w,
                  child: CircularProgressIndicator(

                    value: 1,
                    strokeWidth: 5,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColor.bg),
                  ),
                ),
                SizedBox(
                  height: 66.h,
                  width: 66.w,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 5,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColor.primarryColor),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Center(
                  child: Image(image: AssetImage(imagePath),height: 30,width: 30,),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),

          Expanded(child: Text(title,style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold
          ),)),
          Expanded(child: Text(subtitle1,style: TextStyle(fontSize: 12),)),
          Expanded(child: Text(subtitle2,style: TextStyle(fontSize: 12) )),
        ],
      ),
    );
  }
}



