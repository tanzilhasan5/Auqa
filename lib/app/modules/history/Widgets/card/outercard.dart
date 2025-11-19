import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/App_Color/app_color.dart';
import '../../../../utils/Text_Style/text_Style.dart';
import '../../model/history_model.dart';
import 'innercard.dart';

class OuterCard extends StatelessWidget {
  final String title;
  final List<HistoryModel> logs;

  const OuterCard({
    super.key,
    required this.title,
    required this.logs,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.cardcolor,
      elevation: 1,
      margin: EdgeInsets.only(bottom: 14.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title (Morning / Afternoon / Evening)
            Text(
              title,
              style: AppTextStyles.title14_w500(color: Colors.black),
            ),

            SizedBox(height: 10.h),

            /// Inner List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: logs.length,
              itemBuilder: (_, innerIndex) {
                return InnerCard(
                  model: logs[innerIndex],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}