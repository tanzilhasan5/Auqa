import 'package:aqua/app/utils/App_Color/app_color.dart';
import 'package:aqua/app/utils/Text_Style/text_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Widgets/calender/view/calender.dart';
import '../Widgets/card/outercard.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 374,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: AppColor.cardcolor
            ),
            child: Column(
              children: [
                SizedBox(height: 44.h,),
                Text('History'),
                HistoryCalendar(),
              ],
            ),
          ),
          SizedBox(height: 20.h),
      
          Expanded(
            child: Obx(() => ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: controller.outerList.length,
              itemBuilder: (_, index) {
                return
                  Padding(
                    padding: const EdgeInsets.all(19),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Today, 7 October',
                          style: AppTextStyles.title14_w500(color: Colors.black),
                        ),
                        SizedBox(height: 10.h,),
                        OuterCard(
                        title: controller.outerList[index],
                        logs: controller.innerList,
                                        ),
                      ],
                    ),
                  );
              },
            )),
          ),
        ],
      ),
    );
  }
}