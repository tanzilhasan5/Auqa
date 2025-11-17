import 'package:aqua/app/utils/App_Color/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app/utils/Text_Style/text_Style.dart';

class CustomCupertinoActionSheet {
  static Future<String?> show({
    required BuildContext context,
    required List<String> actions,
    required String selectedValue,
    String title = "Select Option",
    double sheetHeight = 250,
  }) {
    String tempValue = selectedValue; // temporary selection

    return showCupertinoModalPopup<String>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25)
              ),

              child: CupertinoActionSheet(
                title: Text(
                  title,style: AppTextStyles.title20_w600(
                  color: Colors.black
                ),
                  /*style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),*/
                ),

                message: Container(
                  color: Colors.white,
                  height: sheetHeight,
                  child: ListView.separated(
                    itemCount: actions.length,
                    separatorBuilder: (_, __) =>
                        Divider(height: 1, color: Colors.grey.shade300),
                    itemBuilder: (context, index) {
                      final item = actions[index];
                      bool isSelected = tempValue == item;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            tempValue = item;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            item,
                            style: TextStyle(
                              color: isSelected
                                  ? CupertinoColors.activeBlue
                                  : CupertinoColors.black,
                              fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w400,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                cancelButton: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Container(
                        height: 41.h,
                        width: 163.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(65),
                          color: Color(0xffDEEFFF),
                        ),
                        child:  Expanded(
                          child: CupertinoActionSheetAction(

                            onPressed: () => Navigator.pop(context, null),
                            child:  Text("Cancel",style: AppTextStyles.title14_w500(color: AppColor.primarryColor),),
                          ),
                        ),
                      ),

                      Container(
                        height: 41.h,
                        width: 163.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(65),
                          color:AppColor.primarryColor,
                        ),
                        child:  Expanded(
                          child: CupertinoActionSheetAction(
                            onPressed: () => Navigator.pop(context, tempValue),
                            child:  Text("Ok",style: AppTextStyles.title14_w500(color: Colors.white),),
                            isDefaultAction: true,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}