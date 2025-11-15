import 'package:aqua/app/routes/app_pages.dart';
import 'package:aqua/app/utils/App_Color/app_color.dart';
import 'package:aqua/app/utils/Text_Style/text_Style.dart';
import 'package:aqua/reuse_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class DailyGoal extends StatelessWidget {
  const DailyGoal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar:
      AppBar(
        leading: BackButton(
          color: AppColor.primarryColor,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(25)),
        title: Text(' Daily Goal'),
      ),
      body: Padding(
        padding:  EdgeInsets.all(42),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 185.h,),

           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('Set daily goal',style: AppTextStyles.title26_w600(),),
               SizedBox(height: 20.h,),
             ],
           ),
            Text('Your recommended goal: 2500 ml/day',style: AppTextStyles.title16_w400(),),
            SizedBox(height: 40.h,),
            SizedBox(
              height: 44.h,
              width: 179.w,
              child:
              Container(
                height: 44.h,
                width: 179.w,
                decoration: BoxDecoration(
                  border: Border.all(width: 2,
                      color: AppColor.primarryColor),

                  color: AppColor.cardcolor,
                  borderRadius: BorderRadius.circular(60),
                ),

                child: Center(child: Text('2500 ml')),
              ),
            ),
            Spacer(),
            CustomButton(title: 'Edit',onpress: (){
              Get.toNamed(Routes.EDITGOAl);
            },)
          ],
        ),
      ),
    );
  }
}
