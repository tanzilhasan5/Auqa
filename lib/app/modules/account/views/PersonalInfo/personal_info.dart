


import 'package:aqua/app/modules/account/views/PersonalInfo/model/model.dart';
import 'package:aqua/app/utils/Text_Style/text_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/App_Color/app_color.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  List<PersonalInfoModel> reminders = [
    PersonalInfoModel(time: '06:30 AM', days: ['Fri'], isActive: true),
  ];

  String wakeUpTime = "07:00 AM";
  String bedTime = "10:00 PM";
  String age = "32 ";
  String kg = "32 ";
  String gender = "Male ";
  String activeLavel = "Moderate ";
  String weather = "Mid ";


  String _currentEditing = "";

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        leading: BackButton(color: AppColor.primarryColor),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Personal Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 20),
        child: Container(
          height: 360.h,
          width: 336.w,
          decoration: BoxDecoration(
            color: AppColor.cardcolor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25.w,vertical: 25.w),
            child: Column(
              children: [


                InkWell(
                  onTap:_showCustomGenderPicker,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Gender', style: AppTextStyles.title16_w600()),
                      Text('$gender', style: AppTextStyles.title14_w500(color: AppColor.primarryColor)),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                InkWell(
                  onTap: _showCustomWeigntPicker,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Weight', style: AppTextStyles.title16_w600()),
                      Text('$kg kg', style: AppTextStyles.title14_w500(color: AppColor.primarryColor)),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                InkWell(
                  onTap: _showCustomAgePicker,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Age', style: AppTextStyles.title16_w600()),
                      Text('$age years', style: AppTextStyles.title14_w500(color: AppColor.primarryColor)),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                InkWell(
                  onTap: () {
                    _currentEditing = "wakeup";
                    _showCustomTimePicker();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Wake-up Time', style: AppTextStyles.title16_w600()),
                      Text(wakeUpTime, style: AppTextStyles.title14_w500(color: AppColor.primarryColor)),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                InkWell(
                  onTap: () {
                    _currentEditing = "bedtime";
                    _showCustomTimePicker();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Bedtime', style: AppTextStyles.title16_w600()),
                      Text(bedTime, style: AppTextStyles.title14_w500(color: AppColor.primarryColor)),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                InkWell(
                  onTap:_showCustomActiveLavel,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Activity Level', style: AppTextStyles.title16_w600()),
                      Text('$activeLavel', style: AppTextStyles.title14_w500(color: AppColor.primarryColor)),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                InkWell(
                  onTap: _showCustomWeather,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Weather', style: AppTextStyles.title16_w600()),
                      Text('$weather', style: AppTextStyles.title14_w500(color: AppColor.primarryColor)),
                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
  ///<<<<< this is botomshit>>>>>>////

  void _showCustomTimePicker() {
    TimeOfDay selectedTime = TimeOfDay.now();
    bool isAM = selectedTime.period == DayPeriod.am;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 12),
                Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Set Time',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 30),

                // Time picker wheels (Hour : Minute AM/PM)
                Container(
                  height: 200.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 70.w,
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 50,
                          perspective: 0.005,
                          diameterRatio: 1.2,
                          physics: const FixedExtentScrollPhysics(),
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
                              final hour = index % 12 == 0 ? 12 : index % 12;
                              final isSelected = hour == (selectedTime.hour % 12 == 0 ? 12 : selectedTime.hour % 12);
                              return Center(
                                child: Text(
                                  hour.toString().padLeft(2, '0'),
                                  style: TextStyle(
                                    fontSize: isSelected ? 32.sp : 20.sp,
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                    color: isSelected ? AppColor.primarryColor : Colors.grey,
                                  ),
                                ),
                              );
                            },
                            childCount: 120,
                          ),
                        ),
                      ),

                      // Colon
                      Text(':', style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, color: AppColor.primarryColor)),

                      // Minute wheel
                      SizedBox(
                        width: 70.w,
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 50,
                          perspective: 0.005,
                          diameterRatio: 1.2,
                          physics: const FixedExtentScrollPhysics(),
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
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                    color: isSelected ? AppColor.primarryColor : Colors.grey,
                                  ),
                                ),
                              );
                            },
                            childCount: 60,
                          ),
                        ),
                      ),

                      const SizedBox(width: 20),

                      // AM/PM wheel
                      SizedBox(
                        width: 60.w,
                        child: ListWheelScrollView(
                          itemExtent: 50,
                          perspective: 0.005,
                          diameterRatio: 1.2,
                          physics: const FixedExtentScrollPhysics(),
                          onSelectedItemChanged: (index) {
                            setModalState(() {
                              isAM = index == 0;
                            });
                          },
                          children: [
                            Center(
                                child: Text('AM',
                                    style: TextStyle(
                                      fontSize: isAM ? 32.sp : 20.sp,
                                      fontWeight: isAM ? FontWeight.bold : FontWeight.normal,
                                      color: isAM ? AppColor.primarryColor : Colors.grey,
                                    ))),
                            Center(
                              child: Text('PM',
                                  style: TextStyle(
                                    fontSize: !isAM ? 32.sp : 20.sp,
                                    fontWeight: !isAM ? FontWeight.bold : FontWeight.normal,
                                    color: !isAM ? AppColor.primarryColor : Colors.grey,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                const Spacer(),

                // Cancel & OK buttons
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
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          child:  Text('Cancel',
                              style: TextStyle(color: AppColor.primarryColor, fontWeight: FontWeight.w600)),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Convert to 12-hour format selectedTime + AM/PM → proper 12-hour string
                            int hour24 = selectedTime.hour;
                            if (!isAM && selectedTime.hour < 12) hour24 += 12;
                            if (isAM && selectedTime.hour == 12) hour24 = 0;

                            final hour12 = hour24 == 0
                                ? 12
                                : hour24 > 12
                                ? hour24 - 12
                                : hour24;

                            final timeString =
                                '${hour12.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')} ${isAM ? 'AM' : 'PM'}';

                            // Update the correct field based on what user was editing
                            setState(() {
                              if (_currentEditing == "wakeup") {
                                wakeUpTime = timeString;
                              } else if (_currentEditing == "bedtime") {
                                bedTime = timeString;
                              }
                            });

                            Navigator.pop(context);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Time updated successfully!'),
                                backgroundColor: AppColor.primarryColor,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primarryColor,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          child: const Text('OK',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
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
  void _showCustomAgePicker() {
    int selectedAge = 25;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.55,
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

                // Drag handle
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
                  'Select Age',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 30.h),

                Expanded(
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 60,
                    perspective: 0.005,
                    diameterRatio: 1.8,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setModalState(() {
                        selectedAge = index + 1;
                      });
                    },
                    controller: FixedExtentScrollController(initialItem: selectedAge - 1),
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        if (index < 0 || index > 99) return null;
                        final age = index + 1;
                        final isSelected = age == selectedAge;

                        return Center(
                          child: Text(
                            age.toString(),
                            style: TextStyle(
                              fontSize: isSelected ? 36.sp : 22.sp,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected ? AppColor.primarryColor : Colors.grey,
                            ),
                          ),
                        );
                      },
                      childCount: 100,
                    ),
                  ),
                ),

                SizedBox(height: 30.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                            // Update your age variable here
                            setState(() {
                               age = selectedAge.toString();
                              // Or directly: ageText = "$selectedAge years";
                            });

                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Age set to $selectedAge years'),
                                backgroundColor: AppColor.primarryColor,
                              ),
                            );
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
                            'OK',
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

                SizedBox(height: 20.h),
              ],
            ),
          );
        },
      ),
    );
  }
  void _showCustomWeigntPicker() {
    int selectedKg = 62;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.55,
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

                // Drag handle
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
                  'Select Weight',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 30.h),

                Expanded(
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 60,
                    perspective: 0.005,
                    diameterRatio: 1.8,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setModalState(() {
                        selectedKg = index + 1;
                      });
                    },
                    controller: FixedExtentScrollController(initialItem: selectedKg - 1),
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        if (index < 0 || index > 1000) return null;
                        final age = index + 1;
                        final isSelected = age == selectedKg;

                        return Center(
                          child: Text(
                            age.toString(),
                            style: TextStyle(
                              fontSize: isSelected ? 36.sp : 22.sp,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected ? AppColor.primarryColor : Colors.grey,
                            ),
                          ),
                        );
                      },
                      childCount: 100,
                    ),
                  ),
                ),

                SizedBox(height: 30.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                            setState(() {
                               kg = selectedKg.toString();

                            });

                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Weight set to $selectedKg Kg'),
                                backgroundColor: AppColor.primarryColor,
                              ),
                            );
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
                            'OK',
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

                SizedBox(height: 20.h),
              ],
            ),
          );
        },
      ),
    );
  }
  void _showCustomGenderPicker() {
    // 0 = Male, 1 = Female, 2 = Prefer not to say
    int selectedIndex = 0; // default = Male (change if needed)

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.58,
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

                // Drag handle
                Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),

                SizedBox(height: 20.h),

                // Title
                Text(
                  'Select Gender',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 40.h),

                // Gender Wheel with 3 options
                Expanded(
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 70,
                    perspective: 0.005,
                    diameterRatio: 1.8,
                    physics: const FixedExtentScrollPhysics(),
                    controller: FixedExtentScrollController(initialItem: selectedIndex),
                    onSelectedItemChanged: (index) {
                      if (index < 3) {
                        setModalState(() {
                          selectedIndex = index;
                        });
                      }
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        final List<String> genders = ['Male', 'Female', 'Prefer not to say'];
                        if (index >= genders.length) return null;

                        final bool isSelected = index == selectedIndex;

                        return Center(
                          child: Text(
                            genders[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isSelected ? 25.sp : 18.sp,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                              color: isSelected ? AppColor.primarryColor : Colors.grey,
                              height: 1.2,
                            ),
                          ),
                        );
                      },
                      childCount: 3,
                    ),
                  ),
                ),

                SizedBox(height: 40.h),

                // Cancel & OK Buttons (same as before)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: AppColor.primarryColor, fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            final List<String> genders = ['Male', 'Female', 'Prefer not to say'];
                            final String selectedGender = genders[selectedIndex];

                            setState(() {
                              gender = selectedGender; // Update your gender variable
                            });

                            Navigator.pop(context);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Gender set to $selectedGender'),
                                backgroundColor: AppColor.primarryColor,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primarryColor,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                          ),
                          child: Text(
                            'OK',
                            style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
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
  void _showCustomActiveLavel() {
    // 0 = Male, 1 = Female, 2 = Prefer not to say
    int selectedIndex = 0; // default = Male (change if needed)

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.58,
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

                // Drag handle
                Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),

                SizedBox(height: 20.h),

                // Title
                Text(
                  'Select Active Lavel',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 40.h),

                // Gender Wheel with 3 options
                Expanded(
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 70,
                    perspective: 0.005,
                    diameterRatio: 1.8,
                    physics: const FixedExtentScrollPhysics(),
                    controller: FixedExtentScrollController(initialItem: selectedIndex),
                    onSelectedItemChanged: (index) {
                      if (index < 3) {
                        setModalState(() {
                          selectedIndex = index;
                        });
                      }
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        final List<String> lavel = ['Low', 'Moderate', 'High'];
                        if (index >= lavel.length) return null;

                        final bool isSelected = index == selectedIndex;

                        return Center(
                          child: Text(
                            lavel[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isSelected ? 25.sp : 18.sp,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                              color: isSelected ? AppColor.primarryColor : Colors.grey,
                              height: 1.2,
                            ),
                          ),
                        );
                      },
                      childCount: 3,
                    ),
                  ),
                ),

                SizedBox(height: 40.h),

                // Cancel & OK Buttons (same as before)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: AppColor.primarryColor, fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            final List<String> lavel = ['Low', 'Moderate', 'High'];
                            final String selectedlavel = lavel[selectedIndex];

                            setState(() {
                              activeLavel = selectedlavel; // Update your gender variable
                            });

                            Navigator.pop(context);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Active Lavel set to $selectedlavel'),
                                backgroundColor: AppColor.primarryColor,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primarryColor,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                          ),
                          child: Text(
                            'OK',
                            style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
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
  void _showCustomWeather() {
    int selectedIndex = 0;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.58,
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

                ///<<<<<<< Drag handle
                Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),

                SizedBox(height: 20.h),

                ///<<<<<< Title>>>>>////
                Text(
                  'Select Weather',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 40.h),

                /// <<<< Gender Wheel with 3 options>>>>>
                Expanded(
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 70,
                    perspective: 0.005,
                    diameterRatio: 1.8,
                    physics: const FixedExtentScrollPhysics(),
                    controller: FixedExtentScrollController(initialItem: selectedIndex),
                    onSelectedItemChanged: (index) {
                      if (index < 3) {
                        setModalState(() {
                          selectedIndex = index;
                        });
                      }
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        final List<String> wea =['Cold', 'Mid', 'Hot'];
                        if (index >= wea.length) return null;

                        final bool isSelected = index == selectedIndex;

                        return Center(
                          child: Text(
                            wea[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isSelected ? 25.sp : 18.sp,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                              color: isSelected ? AppColor.primarryColor : Colors.grey,
                              height: 1.2,
                            ),
                          ),
                        );
                      },
                      childCount: 3,
                    ),
                  ),
                ),

                SizedBox(height: 40.h),

                // Cancel & OK Buttons (same as before)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: AppColor.primarryColor, fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            final List<String> wid = ['Cold', 'Mid', 'Hot'];
                            final String selectedwid = wid[selectedIndex];

                            setState(() {
                              weather = selectedwid; // Update your gender variable
                            });

                            Navigator.pop(context);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Weather set to $selectedwid'),
                                backgroundColor: AppColor.primarryColor,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primarryColor,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                          ),
                          child: Text(
                            'OK',
                            style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
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
