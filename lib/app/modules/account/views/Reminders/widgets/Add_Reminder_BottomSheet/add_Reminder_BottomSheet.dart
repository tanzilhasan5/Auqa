// features/reminders/view/add_reminder_bottomsheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:aqua/app/utils/App_Color/app_color.dart';

import '../../controller/remember_controller.dart';
import '../../model/model.dart';

class AddReminderBottomSheet extends StatelessWidget {
  final controller = Get.find<RemindersController>();

  AddReminderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // Local reactive state for bottom sheet only
    var selectedTime = TimeOfDay.now().obs;
    var selectedDays = <String>{}.obs;
    var isAM = true.obs;

    return Container(
      height: Get.height * 0.65,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        children: [
          SizedBox(height: 12.h),
          Container(width: 40.w, height: 4.h, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2.r))),
          SizedBox(height: 20.h),
          Text('New Alarm', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
          SizedBox(height: 30.h),

          // Custom Time Picker
          SizedBox(
            height: 200.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildHourWheel(selectedTime, isAM),
                Text(':', style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, color: AppColor.primarryColor)),
                _buildMinuteWheel(selectedTime),
                SizedBox(width: 20.w),
                _buildAmPmWheel(isAM),
              ],
            ),
          ),

          SizedBox(height: 30.h),
          Text('Repeat', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
          SizedBox(height: 20.h),

          // Days Selector
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['S', 'M', 'T', 'W', 'T', 'F', 'S'].asMap().entries.map((e) {
                final dayFull = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][e.key];
                final selected = selectedDays.contains(dayFull);
                return GestureDetector(
                  onTap: () => selected ? selectedDays.remove(dayFull) : selectedDays.add(dayFull),
                  child: CircleAvatar(
                    radius: 22.r,
                    backgroundColor: selected ? AppColor.primarryColor : Colors.grey[300],
                    child: Text(e.value, style: TextStyle(color: selected ? Colors.white : Colors.grey[600], fontWeight: FontWeight.w600, fontSize: 16.sp)),
                  ),
                );
              }).toList(),
            )),
          ),

          Spacer(),

          // Buttons
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[200], shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)), padding: EdgeInsets.symmetric(vertical: 15.h)),
                    child: Text('Cancel', style: TextStyle(color: AppColor.primarryColor, fontSize: 16.sp, fontWeight: FontWeight.w600)),
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (selectedDays.isEmpty) {
                        Get.snackbar("Error", "Please select at least one day", backgroundColor: Colors.red, colorText: Colors.white);
                        return;
                      }

                      int hour24 = selectedTime.value.hour;
                      int displayHour = hour24 % 12; if (displayHour == 0) displayHour = 12;
                      String period = hour24 < 12 ? 'AM' : 'PM';
                      String timeStr = '${displayHour.toString().padLeft(2, '0')}:${selectedTime.value.minute.toString().padLeft(2, '0')} $period';

                      controller.reminders.add(ReminderModel(
                        time: timeStr,
                        days: selectedDays.toList(),
                        isActive: true,
                      ));

                      Get.back();
                      Get.snackbar("Success", "Reminder added", backgroundColor: AppColor.primarryColor, colorText: Colors.white);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: AppColor.primarryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)), padding: EdgeInsets.symmetric(vertical: 15.h)),
                    child: Text('Ok', style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHourWheel(Rx<TimeOfDay> time, RxBool isAM) {
    return SizedBox(
      width: 70.w,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 50,
        physics: FixedExtentScrollPhysics(),
        onSelectedItemChanged: (i) {
          final h = i % 12 == 0 ? 12 : i % 12;
          time.value = TimeOfDay(hour: h + (isAM.value ? 0 : 12), minute: time.value.minute);
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (_, i) {
            final h = i % 12 == 0 ? 12 : i % 12;
            final current = time.value.hour % 12; final isCurrent = h == (current == 0 ? 12 : current);
            return Center(child: Text(h.toString().padLeft(2, '0'), style: TextStyle(fontSize: isCurrent ? 32.sp : 20.sp, fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal, color: isCurrent ? AppColor.primarryColor : Colors.grey)));
          },
          childCount: 120,
        ),
      ),
    );
  }

  Widget _buildMinuteWheel(Rx<TimeOfDay> time) {
    return SizedBox(
      width: 70.w,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 50,
        physics: FixedExtentScrollPhysics(),
        onSelectedItemChanged: (i) => time.value = TimeOfDay(hour: time.value.hour, minute: i),
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (_, i) => Center(
            child: Text(i.toString().padLeft(2, '0'), style: TextStyle(fontSize: i == time.value.minute ? 32.sp : 20.sp, fontWeight: i == time.value.minute ? FontWeight.bold : FontWeight.normal, color: i == time.value.minute ? AppColor.primarryColor : Colors.grey)),
          ),
          childCount: 60,
        ),
      ),
    );
  }

  Widget _buildAmPmWheel(RxBool isAM) {
    return SizedBox(
      width: 60.w,
      child: ListWheelScrollView(
        itemExtent: 50,
        physics: FixedExtentScrollPhysics(),
        onSelectedItemChanged: (i) => isAM.value = i == 0,
        children: ['AM', 'PM'].map((p) {
          final selected = (p == 'AM') == isAM.value;
          return Center(child: Text(p, style: TextStyle(fontSize: selected ? 32.sp : 20.sp, fontWeight: selected ? FontWeight.bold : FontWeight.normal, color: selected ? AppColor.primarryColor : Colors.grey)));
        }).toList(),
      ),
    );
  }
}