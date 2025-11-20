import 'package:aqua/app/modules/Achievements/views/widgets/achivement_circle_progress.dart';
import 'package:aqua/app/utils/App_Color/app_color.dart';
import 'package:aqua/app/utils/App_image/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../utils/Text_Style/text_Style.dart';
import '../controllers/achievements_controller.dart';

class AchievementsView extends GetView<AchievementsController> {
  const AchievementsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Column(


        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.cardcolor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
            ),
            height: 158.h,
            width: 374.w,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 44.h,),
                Text('Achievements',style: AppTextStyles.title20_w600(),),
                SizedBox(height: 10.h,),
                Text('Track your hydration milestones and ',style: AppTextStyles.title16_w400(),),
                Text('celebrate your progress!',style: AppTextStyles.title16_w400(),),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8),
            child:
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.people.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 25.h,
                childAspectRatio: 0.78,
              ),
              itemBuilder: (context, index) {
                final item = controller.people[index];
                return AchievementProgressCircle(
                  index: index,
                  progress: double.parse(item["progress"] ?? "0.0"),
                  imagePath: item["imagePath"] ?? Img.water,
                  title: item["title"] ?? "",
                  subtitle1: item["subtitle1"] ?? "",
                  subtitle2: item["subtitle2"] ?? "",
                );
              },
            )


          )
        ],
      ),
    );
  }
}



