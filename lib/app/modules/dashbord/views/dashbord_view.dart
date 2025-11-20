
import 'package:aqua/app/modules/dashbord/views/yearly_drink_completion/yearly.dart';
import 'package:aqua/app/utils/App_Color/app_color.dart';
import 'package:aqua/app/utils/Text_Style/text_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'Weeklydrink_completition/weekly.dart';
import 'monthly_drink_completion/monthly.dart';

class DashbordView extends StatefulWidget {
  const DashbordView({super.key});

  @override
  State<DashbordView> createState() => _DashbordViewState();
}

class _DashbordViewState extends State<DashbordView>
    with SingleTickerProviderStateMixin {

  // This controls what period is currently displayed
  DateTime selectedDate = DateTime.now();

  late TabController _tabController;
  int currentTabIndex = 0; // 0 = Weekly, 1 = Monthly, 2 = Yearly

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // Listen when user switches tabs
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          currentTabIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Helper: Go to previous period (week/month/year)
  void _goPrevious() {
    setState(() {
      if (currentTabIndex == 0) {
        // Weekly: go back 7 days
        selectedDate = selectedDate.subtract(const Duration(days: 7));
      } else if (currentTabIndex == 1) {
        // Monthly: go back 1 month
        selectedDate = DateTime(selectedDate.year, selectedDate.month - 1);
      } else {
        // Yearly: go back 1 year
        selectedDate = DateTime(selectedDate.year - 1);
      }
    });
  }

  // Helper: Go to next period
  void _goNext() {
    setState(() {
      if (currentTabIndex == 0) {
        selectedDate = selectedDate.add(const Duration(days: 7));
      } else if (currentTabIndex == 1) {
        selectedDate = DateTime(selectedDate.year, selectedDate.month + 1);
      } else {
        selectedDate = DateTime(selectedDate.year + 1);
      }
    });
  }

  // Format the date text based on current tab
  String _getHeaderText() {
    if (currentTabIndex == 0) {
      final weekStart = selectedDate.subtract(Duration(days: selectedDate.weekday - 1)); // Monday
      final weekEnd = weekStart.add(const Duration(days: 6)); // Sunday

      if (weekStart.month == weekEnd.month && weekStart.year == weekEnd.year) {
        return '${DateFormat('MMM d').format(weekStart)} - ${DateFormat('d, yyyy').format(weekEnd)}';
      } else {
        return '${DateFormat('MMM d').format(weekStart)} - ${DateFormat('MMM d, yyyy').format(weekEnd)}';
      }
    } else if (currentTabIndex == 1) {
      // Monthly: October, 2025
      return DateFormat('MMMM, yyyy').format(selectedDate);
    } else {
      // Yearly: 2025
      return DateFormat('yyyy').format(selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250.h,
            width: 374.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: AppColor.cardcolor,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.w),
              child: Column(
                children: [
                  SizedBox(height: 40.h),

                  // Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Analytics', style: AppTextStyles.title26_w600()),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  // TabBar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    padding: EdgeInsets.all(4),
                    child: TabBar(
                      controller: _tabController,
                      indicator: BoxDecoration(
                        color: const Color(0xFF3B82F6),
                        borderRadius: BorderRadius.circular(25.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey[700],
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                      tabs: const [
                        Tab(text: 'Weekly'),
                        Tab(text: 'Monthly'),
                        Tab(text: 'Yearly'),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// Dynamic Date Header with Arrows
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      IconButton(
                        onPressed: _goPrevious,
                        icon: Icon(Icons.chevron_left, size: 36.sp, color: Colors.grey[700]),
                      ),


                      // Date Text
                      Text(
                        _getHeaderText(),
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),




                      IconButton(
                        onPressed: _goNext,
                        icon: Icon(Icons.chevron_right, size: 36.sp, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 30.h),

          /// Tab View
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Weekly(selectedDate: selectedDate),
                Monthly(selectedDate: selectedDate,),
                Yearly(selectedDate: selectedDate,)

              ],
            ),
          ),
        ],
      ),
    );
  }
}
