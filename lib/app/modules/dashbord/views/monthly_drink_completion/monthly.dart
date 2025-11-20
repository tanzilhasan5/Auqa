import 'package:aqua/app/modules/dashbord/views/monthly_drink_completion/widgets/%20drink_chart/drink_chart.dart';
import 'package:aqua/app/modules/dashbord/views/monthly_drink_completion/widgets/hydrate_chart/hydrate_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/App_Color/app_color.dart';
import '../../../../utils/App_image/app_image.dart';
import '../../../../utils/Text_Style/text_Style.dart';


class Monthly extends StatelessWidget {
  const Monthly({
    super.key, required DateTime selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
      child: Padding(
        padding: const EdgeInsets.all(19),
        child:
        Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.cardcolor,
                ),
                height: 339.h,
                width: 336.w,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Drink Completion',style: AppTextStyles.title16_w500(color: AppColor.primarryColor),),
                          ImageIcon(AssetImage(Icn.analetics,),color: AppColor.primarryColor,)
                        ],
                      ),
                      SizedBox(height: 30.h),
                      MonthlyDrinkChart(),
                    ],
                  ),
                )),
            SizedBox(height: 30.h,),
            ///<<<<Hydrate>>>>>///
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.cardcolor,
                ),
                height: 339.h,
                width: 336.w,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Hydrate',style: AppTextStyles.title16_w500(color: AppColor.primarryColor),),
                          ImageIcon(AssetImage(Icn.analetics,),color: AppColor.primarryColor,)
                        ],
                      ),
                      SizedBox(height: 30.h),
                      MonthlyHydrate(),
                    ],
                  ),
                )),
            SizedBox(height: 30.h,),
            ///<<<<<<<Drink Type>>>>>>>/////
            Container(

              height: 234.h,
              width: 336.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.cardcolor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Drink Type',),
                    SizedBox(height: 20.h,),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 150.h,
                            width: 150.w,
                            child: AspectRatio(
                              aspectRatio: 1.5,
                              child: PieChart(
                                PieChartData(
                                    pieTouchData: PieTouchData(
                                      enabled: true,
                                    ),
                                    sections: [

                                      PieChartSectionData(value: 70,color: AppColor.primarryColor,showTitle: false),
                                      PieChartSectionData(value: 10,color: Color(0xffFE9017),showTitle: false),
                                      PieChartSectionData(value: 10,color: Color(0xff7E5317),showTitle: false),
                                      PieChartSectionData(value: 5,color: Color(0xffFFEB3C),showTitle: false),
                                    ]

                                ),
                                duration: Duration(milliseconds: 150),
                              ),
                            ),
                          ),

                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppColor.primarryColor
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),Text('Water (70%)'),
                                ],
                              ),
                              SizedBox(height: 16,),
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xff7E5317)
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),Text('Water (70%)'),
                                ],
                              ),
                              SizedBox(height: 16,),
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xffFE9017)
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),Text('Water (70%)'),
                                ],
                              ),
                              SizedBox(height: 16,),
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xffFFEB3C)
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),Text('Water (70%)'),
                                ],
                              ),
                              SizedBox(height: 16,),

                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}