import 'package:aqua/app/routes/app_pages.dart';
import 'package:aqua/app/utils/App_Color/app_color.dart';
import 'package:aqua/app/utils/Text_Style/text_Style.dart';
import 'package:aqua/reuse_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditGoal extends StatelessWidget {
  const EditGoal({super.key});

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
        title: Text(' Dayli Goal'),
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
              child: TextFormField(
                keyboardType: TextInputType.number,

                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  suffixText: 'ml',

                  enabledBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: BorderSide(
                          width: 2,
                          color: AppColor.primarryColor
                      )

                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: BorderSide(
                          color: AppColor.primarryColor,
                          width: 2
                      )

                  ),


                ),

              ),
            ),
            Spacer(),
            CustomButton(title: 'Set daily goal',onpress: (){
             Get.back();
            },)
          ],
        ),
      ),
    );
  }
}
