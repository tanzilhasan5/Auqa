import 'package:aqua/app/modules/account/views/widgets/custom_switch.dart';
import 'package:aqua/app/utils/App_Color/app_color.dart';
import 'package:aqua/app/utils/App_image/app_image.dart';
import 'package:aqua/app/utils/Text_Style/text_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReminderModel {
  String time;
  List<String> days;
  bool isActive;

  ReminderModel({
    required this.time,
    required this.days,
    required this.isActive,
  });
}

class Reminders extends StatefulWidget {
  const Reminders({super.key});

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders>
    with SingleTickerProviderStateMixin {
  List<ReminderModel> reminders = [
    ReminderModel(time: '06:30 AM', days: ['Fri'], isActive: true),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _addReminder() {
    _showCustomTimePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 217.h,
            width: 374.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: AppColor.cardcolor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(19),
              child: Column(
                children: [
                  SizedBox(height: 44.h),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColor.primarryColor,
                        ),
                      ),
                      SizedBox(width: 108.5.w),
                      Text('Reminders', style: AppTextStyles.title26_w600()),
                    ],
                  ),
                  SizedBox(height: 35.h),
                  TabBar(
                    controller: _tabController,
                    indicatorColor: AppColor.primarryColor,
                    labelColor: AppColor.primarryColor,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                    tabs: [
                      AnimatedBuilder(
                        animation: _tabController,
                        builder: (context, _) {
                          bool isSelected = _tabController.index == 0;
                          return Tab(
                            icon: CircleAvatar(
                              backgroundColor:
                              isSelected ? Colors.red : Color(0xffB2B2B2),
                              child: ImageIcon(
                                AssetImage(Icn.reminders),
                                size: 24.sp,
                                color: Colors.white,
                              ),
                            ),
                            text: 'Reminders off',
                          );
                        },
                      ),
                      AnimatedBuilder(
                        animation: _tabController,
                        builder: (context, _) {
                          bool isSelected = _tabController.index == 1;
                          return Tab(
                            icon: CircleAvatar(
                              backgroundColor: isSelected
                                  ? AppColor.primarryColor
                                  : Color(0xffB2B2B2),
                              child: ImageIcon(
                                AssetImage(Icn.reminders),
                                size: 24.sp,
                                color: Colors.white,
                              ),
                            ),
                            text: 'Auto reminders',
                          );
                        },
                      ),
                            ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [_buildRemindersList(), _buildRemindersList()],
            ),
          ),
        ],
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton(
        onPressed: _addReminder,
        backgroundColor: AppColor.primarryColor,
        child: Icon(Icons.add, color: Colors.white, size: 30.sp),
      )
          : null,
    );
  }

  void _showCustomTimePicker() {
    TimeOfDay selectedTime = TimeOfDay.now();
    Set<String> selectedDays = {};
    bool isAM = true; // Track AM/PM selection

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 12.h),
                Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'New Alarm',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30.h),
                ///<<<<< Time Picker>>>>>>
                Container(
                  height: 200.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Hour Picker
                      SizedBox(
                        width: 70.w,
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 50,
                          perspective: 0.005,
                          diameterRatio: 1.2,
                          physics: FixedExtentScrollPhysics(),
                          onSelectedItemChanged: (index) {
                            setModalState(() {
                              selectedTime = TimeOfDay(
                                hour: index % 12 == 0 ? 12 : index % 12,
                                minute: selectedTime.minute,
                              );
                            });
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              final hour = (index % 12 == 0) ? 12 : index % 12;
                              final isSelected = hour == selectedTime.hour ||
                                  (selectedTime.hour == 0 && hour == 12);
                              return Center(
                                child: Text(
                                  hour.toString().padLeft(2, '0'),
                                  style: TextStyle(
                                    fontSize: isSelected ? 32.sp : 20.sp,
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: isSelected
                                        ? AppColor.primarryColor
                                        : Colors.grey,
                                  ),
                                ),
                              );
                            },
                            childCount: 120,
                          ),
                        ),
                      ),
                      Text(
                        ':',
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primarryColor,
                        ),
                      ),
                      // Minute Picker
                      SizedBox(
                        width: 70.w,
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 50,
                          perspective: 0.005,
                          diameterRatio: 1.2,
                          physics: FixedExtentScrollPhysics(),
                          onSelectedItemChanged: (index) {
                            setModalState(() {
                              selectedTime = TimeOfDay(
                                hour: selectedTime.hour,
                                minute: index,
                              );
                            });
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              final isSelected = index == selectedTime.minute;
                              return Center(
                                child: Text(
                                  index.toString().padLeft(2, '0'),
                                  style: TextStyle(
                                    fontSize: isSelected ? 32.sp : 20.sp,
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: isSelected
                                        ? AppColor.primarryColor
                                        : Colors.grey,
                                  ),
                                ),
                              );
                            },
                            childCount: 60,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      // AM/PM Picker
                      SizedBox(
                        width: 60.w,
                        child: ListWheelScrollView(
                          itemExtent: 50,
                          perspective: 0.005,
                          diameterRatio: 1.2,
                          physics: FixedExtentScrollPhysics(),
                          onSelectedItemChanged: (index) {
                            setModalState(() {
                              isAM = index == 0;
                            });
                          },
                          children: [
                            Center(
                              child: Text(
                                'AM',
                                style: TextStyle(
                                  fontSize: isAM ? 32.sp : 20.sp,
                                  fontWeight: isAM ? FontWeight.bold : FontWeight.normal,
                                  color: isAM ? AppColor.primarryColor : Colors.grey,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'PM',
                                style: TextStyle(
                                  fontSize: !isAM ? 32.sp : 20.sp,
                                  fontWeight: !isAM ? FontWeight.bold : FontWeight.normal,
                                  color: !isAM ? AppColor.primarryColor : Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  'Repeat',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20.h),
                // Day Selector
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
                        .asMap()
                        .entries
                        .map((entry) {
                      final fullDays = [
                        'Sun',
                        'Mon',
                        'Tue',
                        'Wed',
                        'Thu',
                        'Fri',
                        'Sat'
                      ];
                      final day = fullDays[entry.key];
                      final isSelected = selectedDays.contains(day);
                      return GestureDetector(
                        onTap: () {
                          setModalState(() {
                            if (isSelected) {
                              selectedDays.remove(day);
                            } else {
                              selectedDays.add(day);
                            }
                          });
                        },
                        child: CircleAvatar(
                          radius: 22.r,
                          backgroundColor: isSelected
                              ? AppColor.primarryColor
                              : Colors.grey[300],
                          child: Text(
                            entry.value,
                            style: TextStyle(
                              color:
                              isSelected ? Colors.white : Colors.grey[600],
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Spacer(),
                // Action Buttons
                Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 15.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: AppColor.primarryColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (selectedDays.isNotEmpty) {
                              final hour = selectedTime.hour == 0
                                  ? 12
                                  : selectedTime.hour > 12
                                  ? selectedTime.hour - 12
                                  : selectedTime.hour;
                              final period = isAM ? 'AM' : 'PM';
                              final timeString =
                                  '${hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')} $period';

                              setState(() {
                                reminders.add(
                                  ReminderModel(
                                    time: timeString,
                                    days: selectedDays.toList(),
                                    isActive: true,
                                  ),
                                );
                              });
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Reminder added successfully'),
                                  backgroundColor: AppColor.primarryColor,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Please select at least one day'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primarryColor,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 15.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Text(
                            'Ok',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _deleteReminder(int index) {
    setState(() {
      reminders.removeAt(index);
    });
  }

  Widget _buildRemindersList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 20.h),
      itemCount: reminders.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Dismissible(
            key: Key(reminders[index].time + reminders[index].days.join()),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.red,
              ),
              padding: EdgeInsets.only(right: 20.w),
              child: Icon(Icons.delete, color: Colors.white, size: 30.sp),
            ),
            onDismissed: (direction) {
              _deleteReminder(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Reminder deleted')),
              );
            },
            child: Container(
              height: 89.h,
              width: 336.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColor.cardcolor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          reminders[index].time,
                          style: AppTextStyles.title20_w500(),
                        ),
                        Text(
                          reminders[index].days.join(' '),
                          style: AppTextStyles.title12_w600(),
                        ),
                      ],
                    ),
                    CustomSwitch(
                      title: '',
                      initialValue: reminders[index].isActive,
                      onChanged: (val) {
                        setState(() {
                          reminders[index].isActive = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}