import 'package:aqua/app/utils/App_Color/app_color.dart';
import 'package:aqua/app/utils/Text_Style/text_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/App_image/app_image.dart';
import '../Widgets/calender/view/calender.dart';
import '../Widgets/card/outercard.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            HistoryCalendar(),
            Text(
              'Today, 7 October',
              style: AppTextStyles.title14_w500(color: Colors.black),
            ),
            SizedBox(height: 20.h),

            Expanded(
              child: Obx(() => ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: controller.outerList.length,
                itemBuilder: (_, index) {
                  return
                    OuterCard(
                    title: controller.outerList[index],
                    logs: controller.innerList,
                  );
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}