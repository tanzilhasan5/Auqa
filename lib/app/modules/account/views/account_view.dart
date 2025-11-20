import 'package:aqua/app/routes/app_pages.dart';
import 'package:aqua/app/utils/App_Color/app_color.dart';
import 'package:aqua/app/utils/App_image/app_image.dart';
import 'package:aqua/app/utils/Text_Style/text_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
          Container(
            height: 209.h,
            width: 374.w,
            decoration: BoxDecoration(
              color: AppColor.cardcolor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                SizedBox(height: 44.h,),
                Text('Account',style: AppTextStyles.title26_w600(),),
                SizedBox(height: 35.h,),

                Container(
                  width: 336.w,
                  decoration: BoxDecoration(
                    color:AppColor.primarryColor,
                    borderRadius: BorderRadius.circular(64),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.5, vertical: 15),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColor.cardcolor,
                          child: Image(image: AssetImage(Img.upgrade),fit: BoxFit.cover,),
                        ),
                        SizedBox(width: 19.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Upgrade Plan Now!',style: AppTextStyles.title16_w600(color: Colors.white),),
                            Text('Unlock advanced hydration \n tracking and insights',style: AppTextStyles.title12_w400(color: Colors.white),)
                          ],
                        )

                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
              SizedBox(height: 36.h,),
              Container(

                width: 336.w,
                decoration: BoxDecoration(
                  color: AppColor.cardcolor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    // Personal Info
                    InkWell(
                      onTap: () => Get.toNamed(Routes.PERSONALINFO),
                      child: ListTile(
                        title: Text('Personal Info', style: AppTextStyles.title16_w500()),
                        leading: ImageIcon(AssetImage(Icn.person)),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),

                    // Reminders
                    InkWell(
                      onTap: () => Get.toNamed(Routes.Reminders),
                      child: ListTile(
                        title: Text('Reminders', style: AppTextStyles.title16_w500()),
                        leading: ImageIcon(AssetImage(Icn.reminders)),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),

                    // Daily Goal
                    InkWell(
                      onTap: () => Get.toNamed(Routes.DAILYGOAl),
                      child: ListTile(
                        title: Text('Daily Goal', style: AppTextStyles.title16_w500()),
                        leading: ImageIcon(AssetImage(Icn.dailyGole)),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),

                    // Language
                    InkWell(
                      onTap: () {
                        // Add your language action here
                      },
                      child: ListTile(
                        title: Text('Language', style: AppTextStyles.title16_w500()),
                        leading: ImageIcon(AssetImage(Icn.language)),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),

                    // Privacy Policy
                    InkWell(
                      onTap: () => Get.toNamed(Routes.PRIVACYPOLICY),
                      child: ListTile(
                        title: Text('Privacy Policy', style: AppTextStyles.title16_w500()),
                        leading: ImageIcon(AssetImage(Icn.privacyPolicy)),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),

                    // Subscription
                    InkWell(
                      onTap: () => Get.toNamed(Routes.SUBSCRIPTION),
                      child: ListTile(
                        title: Text('Subscription', style: AppTextStyles.title16_w500()),
                        leading: ImageIcon(AssetImage(Icn.subscription)),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),

                    // Logout
                    InkWell(
                      onTap: () {
                        _showCustomEditePicker(context);
                      },
                      child: ListTile(
                        title: Text('Logout', style: AppTextStyles.title16_w500(color: Colors.red)),
                        leading: ImageIcon(AssetImage(Icn.logout), color: Colors.red),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),
                  ],
                )
              )
        ]
        )
    );
  }
  void _showCustomEditePicker(BuildContext context) {


    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          return Container(
            height: 265.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 62),
                  child: Column(
                    children: [
                      SizedBox(height: 25.h,),

                      Text(
                          'log out?',
                          style: AppTextStyles.title20_w500(color: Colors.red)
                      ),
                      SizedBox(height: 25.h,),
                      Text(
                          'Are you sure you want to',
                          style: AppTextStyles.title20_w500()
                      ),
                      Text(
                          'log out?',
                          style: AppTextStyles.title20_w500()
                      ),
                      SizedBox(height: 50.h,),
                    ],
                  ),
                ),


                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Get.back(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: AppColor.primarryColor, fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.h,),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Get.back(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primarryColor,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
                          ),
                          child: Text(
                            'Yes',
                            style: TextStyle(color:Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                    ],
                  ),
                ),

                SizedBox(height: 30.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
