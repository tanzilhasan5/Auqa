import 'package:aqua/app/utils/Text_Style/text_Style.dart';
import 'package:aqua/reuse_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/App_Color/app_color.dart';

class Subscription extends StatelessWidget {
  const Subscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        leading: BackButton(
          color: AppColor.primarryColor,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(25)),
        title: Text(' Subscription'),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20),
        child:  SingleChildScrollView(
          child: Column(
            children: [
              Container(

                width: 335.w,
                decoration: BoxDecoration(

                  color: AppColor.cardcolor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 34.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Free Trial',style: AppTextStyles.title16_w800(color: AppColor.primarryColor),),
                              Text('7 Days Full Access',style: AppTextStyles.title10_w500(),),
                            ],
                          ),
                          Container(
                            height:30.h ,
                            width: 53.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(34),
                              color: Color(0xffDEEFFF),

                            ),
                            child: Center(child: Text('FREE',style: AppTextStyles.title14_w500(color: AppColor.primarryColor),)),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.check_sharp,color: AppColor.primarryColor,),
                              SizedBox( width: 5.25.w,),
                              Text('Basic water logging')
                            ],
                          ),
                          SizedBox(height: 7.h,),

                          Row(
                            children: [
                              Icon(Icons.check_sharp,color: AppColor.primarryColor,),
                              SizedBox( width: 5.25.w,),
                              Text('Daily progress tracking')
                            ],
                          ),
                          SizedBox(height: 7.h,),
                          Row(
                            children: [
                              Icon(Icons.check_sharp,color: AppColor.primarryColor,),
                              SizedBox( width: 5.25.w,),
                              Text('Simple hydration goals')
                            ],
                          ),
                          SizedBox(height: 7.h,),
                          Row(
                            children: [
                              Icon(Icons.check_sharp,color: AppColor.primarryColor,),
                              SizedBox( width: 5.25.w,),
                              Text('Recent activity view')
                            ],
                          ),
                          SizedBox(height: 30.h,),
                          CustomButton(
                            title: "Start Free Trial",
                            onpress: (){},
                            borderRadius: BorderRadius.circular(10),
                          )

                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.h,),
              Container(

                width: 335.w,
                decoration: BoxDecoration(

                  color: AppColor.cardcolor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 34.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Premium Monthly',style: AppTextStyles.title16_w800(color: Color(0xffFDC109)),),
                              Text('Full access to all features',style: AppTextStyles.title10_w500(),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Free Trial',style: AppTextStyles.title16_w800(color: Color(0xffFDC109),),),
                              Text('/month',style: AppTextStyles.title10_w500())
                            ],
                          ),

                        ],
                      ),
                      SizedBox(height: 20.h,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.check_sharp,color: AppColor.amber,),
                              SizedBox( width: 5.25.w,),
                              Text('Basic water logging')
                            ],
                          ),
                          SizedBox(height: 7.h,),

                          Row(
                            children: [
                              Icon(Icons.check_sharp,color: AppColor.amber,),
                              SizedBox( width: 5.25.w,),
                              Text('Daily progress tracking')
                            ],
                          ),
                          SizedBox(height: 7.h,),
                          Row(
                            children: [
                              Icon(Icons.check_sharp,color: AppColor.amber,),
                              SizedBox( width: 5.25.w,),
                              Text('Simple hydration goals')
                            ],
                          ),
                          SizedBox(height: 7.h,),
                          Row(
                            children: [
                              Icon(Icons.check_sharp,color: AppColor.amber,),
                              SizedBox( width: 5.25.w,),
                              Text('Recent activity view')
                            ],
                          ),
                          SizedBox(height: 30.h,),
                          CustomButton(
                            colors: Color(0xffFDC109),
                            title: "Choose Monthly Plan",
                            onpress: (){},
                            borderRadius: BorderRadius.circular(10),
                          )

                        ],
                      )
                    ],
                  ),
                ),
              ),


            ],
          ),
        )
      ),
    );
  }
}
