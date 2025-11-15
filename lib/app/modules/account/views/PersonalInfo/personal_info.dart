import 'package:aqua/app/utils/Text_Style/text_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/App_Color/app_color.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: AppColor.primarryColor,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(25)),
        title: Text(' Personal Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19,vertical: 30),
        child: Container(
          height: 339.h,
          width: 336.w,
          decoration: BoxDecoration(
            color: AppColor.cardcolor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [

                InkWell(
                  onTap: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Gender',style: AppTextStyles.title16_w600(),),
                      Text('Male',style: AppTextStyles.title14_w500(
                          color: AppColor.primarryColor
                      ),),

                    ],
                  ),
                ),
                SizedBox(height: 25.h,),
                InkWell(
                  onTap: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Weight',style: AppTextStyles.title16_w600(),),
                      Text('62 kg',style: AppTextStyles.title14_w500(
                          color: AppColor.primarryColor
                      ),),

                    ],
                  ),
                ),
                SizedBox(height: 25.h,),
                InkWell(
                  onTap: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Age',style: AppTextStyles.title16_w600(),),
                      Text('32 years',style: AppTextStyles.title14_w500(
                          color: AppColor.primarryColor
                      ),),

                    ],
                  ),
                ),
                SizedBox(height: 25.h,),
                InkWell(
                  onTap: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Wake-up Time',style: AppTextStyles.title16_w600(),),
                      Text('07:00 AM',style: AppTextStyles.title14_w500(
                          color: AppColor.primarryColor
                      ),),

                    ],
                  ),
                ),
                SizedBox(height: 25.h,),
                InkWell(
                  onTap: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Bedtime',style: AppTextStyles.title16_w600(),),
                      Text('20:00 PM',style: AppTextStyles.title14_w500(
                          color: AppColor.primarryColor
                      ),),

                    ],
                  ),
                ),
                SizedBox(height: 25.h,),
                InkWell(
                  onTap: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Activity Level',style: AppTextStyles.title16_w600(),),
                      Text('Moderate',style: AppTextStyles.title14_w500(
                          color: AppColor.primarryColor
                      ),),

                    ],
                  ),
                ),
                SizedBox(height: 25.h,),
                InkWell(
                  onTap: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Weather',style: AppTextStyles.title16_w600(),),
                      Text('Mid',style: AppTextStyles.title14_w500(
                          color: AppColor.primarryColor
                      ),),

                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
