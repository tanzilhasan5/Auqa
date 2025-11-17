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
                  height: 80.h,
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
                height: 368.h,
                width: 336.w,
                decoration: BoxDecoration(
                  color: AppColor.cardcolor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    ListTile(
                      
                      title: Text('Personal Info',style: AppTextStyles.title16_w500(),),
                      leading: ImageIcon(AssetImage(Icn.person)),
                      trailing: InkWell( onTap: (){
                        Get.toNamed(Routes.PERSONALINFO);
                      },
                          child: Icon(Icons.arrow_forward_ios_rounded)),
                    ),
                    ListTile(

                      title: Text('Reminders',style: AppTextStyles.title16_w500(),),
                      leading: ImageIcon(AssetImage(Icn.reminders)),
                      trailing: InkWell( onTap: (){
                        Get.toNamed(Routes.Reminders);
                      },
                          child: Icon(Icons.arrow_forward_ios_rounded)),
                    ),
                    ListTile(

                      title: Text('Daily Goal',style: AppTextStyles.title16_w500(),),
                      leading: ImageIcon(AssetImage(Icn.dailyGole)),
                      trailing: InkWell( onTap: (){
                        Get.toNamed(Routes.DAILYGOAl);
                      },
                          child: Icon(Icons.arrow_forward_ios_rounded)),
                    ),
                    ListTile(

                      title: Text('Language',style: AppTextStyles.title16_w500(),),
                      leading: ImageIcon(AssetImage(Icn.language)),
                      trailing: InkWell( onTap: (){},
                          child: Icon(Icons.arrow_forward_ios_rounded)),
                    ),
                    ListTile(

                      title: Text('Privacy Policy',style: AppTextStyles.title16_w500(),),
                      leading: ImageIcon(AssetImage(Icn.privacyPolicy),),
                      trailing: InkWell( onTap: (){
                        Get.toNamed(Routes.PRIVACYPOLICY);
                      },
                          child: Icon(Icons.arrow_forward_ios_rounded)),
                    ),
                    ListTile(

                      title: Text('Subscription',style: AppTextStyles.title16_w500(),),
                      leading: ImageIcon(AssetImage(Icn.subscription)),
                      trailing: InkWell( onTap: (){
                        Get.toNamed(Routes.SUBSCRIPTION);
                      },
                          child: Icon(Icons.arrow_forward_ios_rounded)),
                    ),
                    ListTile(

                      title: Text('Logout',style: AppTextStyles.title16_w500(color: Colors.red),),
                      leading: ImageIcon(AssetImage(Icn.logout,),color: Colors.red,),
                      trailing: InkWell( onTap: (){},
                          child: Icon(Icons.arrow_forward_ios_rounded)),
                    ),
                  ],
                )
              )
        ]
        )
    );
  }
}
