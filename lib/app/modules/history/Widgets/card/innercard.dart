import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/App_Color/app_color.dart';
import '../../../../utils/App_image/app_image.dart';
import '../../../../utils/Text_Style/text_Style.dart';
import '../../model/history_model.dart';

class InnerCard extends StatefulWidget {
  final HistoryModel model;

  const InnerCard({super.key, required this.model});

  @override
  State<InnerCard> createState() => _InnerCardState();
}

class _InnerCardState extends State<InnerCard> {
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
                Text(widget.model.title, style: AppTextStyles.title16_w500()),
                Text(widget.model.time, style: AppTextStyles.title10_w500()),
              ],
            ),

            const Spacer(),

            Text(
              widget.model.amount,
              style: AppTextStyles.title14_w500(color: Colors.black),
            ),

            PopupMenuButton(

              icon: const Icon(Icons.more_vert_sharp),
              itemBuilder: (context) =>  [
                PopupMenuItem(value: "edit",
                    onTap: (){
                      _showdEditePicker();
                    },
                    child: Text("Edit")),
                PopupMenuItem(value: "delete",
                    onTap: (){
                      _showCustomEditePicker();
                    },
                    child: Text("Delete",style: TextStyle(color:  Colors.red),)),
              ],
            ),
          ],
        ),
      ),
    );


  }

  void _showdEditePicker() {


    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          return Container(
            height: 608.h,
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
                  padding: const EdgeInsets.all(62),
                  child: Column(
                    children: [
                      Text(
                        'Edit water intack',
                        style: AppTextStyles.title20_w500()
                      ),
                      SizedBox(height: 27.h,),
                      Image(image: AssetImage(Img.water)),
                      SizedBox(height: 27.h,),
                      SizedBox(
                        height: 44.h,
                        width: 179.w,
                        child: TextFormField(
                          keyboardType: TextInputType.number,

                          textAlign: TextAlign.center,
                          decoration: InputDecoration(

                            suffixText: 'ml',

                            enabledBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(60),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: AppColor.primarryColor
                                )

                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(60),
                                borderSide: BorderSide(
                                    color: AppColor.primarryColor,
                                    width: 2
                                )

                            ),


                          ),

                        ),
                      ),

                    ],
                  ),
                ),
                Spacer(),


                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
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
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primarryColor,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
                          ),
                          child: Text(
                            'Save',
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
  void _showCustomEditePicker() {


    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          return Container(
            height: 262.h,
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
                  padding: const EdgeInsets.all(62),
                  child: Column(
                    children: [
                      Text(
                        'Are you sure you want to',
                        style: AppTextStyles.title20_w500()
                      ),
                      Text(
                        'delete your history?',
                        style: AppTextStyles.title20_w500()
                      ),
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
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
                          ),
                          child: Text(
                            'No',
                            style: TextStyle(color: AppColor.primarryColor, fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.h,),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
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