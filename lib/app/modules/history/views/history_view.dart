import 'package:aqua/app/utils/App_Color/app_color.dart';
import 'package:aqua/app/utils/Text_Style/text_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../utils/App_image/app_image.dart';
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
            Text('Today, 7 october',style: AppTextStyles.titleFont(color: Colors.black),),
            SizedBox(height: 20.h,),
            Expanded(
              child: Container(
                width: 336.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.cardcolor
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.5),
                  child: Column(
                    children: [
                      Expanded(child: NewWidget())
                    ],
                  ),
                ),

              ),
            )
          ],
        ),
      )
    );
  }

}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 20,
        itemBuilder: (context,index){
      return Container(
        height: 34.h,
        width: 298.w,
        color: Colors.white70,
        child: Row(
          children: [
            Image(image: AssetImage(Img.water)),
            SizedBox(width: 20.w,),
            Column(
              children: [
                Text('Water',style:AppTextStyles.water()),
                Text('6:50 am',style: AppTextStyles.timer()),
              ],
            ),
            Spacer(),
            Text('300 ml',style: TextStyle(),),
            IconButton(onPressed: (){

              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(100, 100, 20, 0),
                items: [
                  PopupMenuItem(
                    child: Text('Edit'),
                    value: 'edit',
                  ),
                  PopupMenuItem(
                    child: Text('Delete'),
                    value: 'delete',
                  ),
                ],
              );
            }, icon: Icon(Icons.more_vert_sharp))
          ],
        ),
      );
    });
  }
}
