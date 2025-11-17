import 'package:aqua/app/modules/account/views/widgets/custom_switch.dart';
import 'package:aqua/app/utils/App_Color/app_color.dart';
import 'package:aqua/app/utils/App_image/app_image.dart';
import 'package:aqua/app/utils/Text_Style/text_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReminderModel {
  String time;
  String day;
  bool isActive;

  ReminderModel({
    required this.time,
    required this.day,
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
    ReminderModel(time: '06:30 AM', day: 'Fri', isActive: true),
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
    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((time) {
      if (time != null) {
        _showDaySelector(time);
      }
    });
  }

  void _showDaySelector(TimeOfDay time) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColor.cardcolor,
        title: Text('Select Day', style: AppTextStyles.title20_w500()),
        content: Wrap(
          spacing: 8,
          children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
              .map(
                (day) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primarryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      reminders.add(
                        ReminderModel(
                          time: time.format(context),
                          day: day,
                          isActive: true,
                        ),
                      );
                    });
                    Navigator.pop(context);
                  },
                  child: Text(day),
                ),
              )
              .toList(),
        ),
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
            key: Key(reminders[index].time + reminders[index].day),
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
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Reminder deleted')));
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
                          reminders[index].day,
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
                              backgroundColor: isSelected ? Colors.red : Color(0xffB2B2B2),
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
                              backgroundColor: isSelected ? AppColor.primarryColor : Color(0xffB2B2B2),
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

                  /*   TabBar(
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
                      Tab(
                        icon: CircleAvatar(
                          backgroundColor: Color(0xffB2B2B2),
                            child: ImageIcon(AssetImage(Icn.reminders), size: 24.sp,color: Colors.white,)),
                        text: 'Reminders off',


                      ),
                      Tab(
                        icon: CircleAvatar(child: ImageIcon(AssetImage(Icn.reminders), size: 24.sp)),
                        text: 'Auto reminders',
                      ),
                    ],
                  )*/
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
}
