import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../utils/App_Color/app_color.dart';
import '../../../utils/App_image/app_image.dart';
import '../../../utils/Text_Style/text_Style.dart';
import '../model/history_model.dart';

class InnerCard extends StatelessWidget {
  final HistoryModel model;

  const InnerCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Container(
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          children: [
            Image(image: AssetImage(Img.water), height: 25.h),
            SizedBox(width: 12.w),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(model.title, style: AppTextStyles.title16_w500()),
                Text(model.time, style: AppTextStyles.title10_w500()),
              ],
            ),

            const Spacer(),

            Text(
              model.amount,
              style: AppTextStyles.title14_w500(color: Colors.black),
            ),

            PopupMenuButton(

              icon: const Icon(Icons.more_vert_sharp),
              itemBuilder: (context) =>  [
                PopupMenuItem(value: "edit", child: InkWell(

                  onTap: (){
                  },

                    child: Text("Edit"))),
                PopupMenuItem(value: "delete", child: Text("Delete",style: TextStyle(color:  Colors.red),)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}