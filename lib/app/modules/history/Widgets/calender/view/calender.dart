
import 'package:aqua/app/modules/history/Widgets/calender/view/widgets/day_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';

class HistoryCalendar extends StatelessWidget {
  const HistoryCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryCalendarController());

    return Column(
      children: [
        Obx(() => controller.isExpanded.value ? _buildHeader(controller) : const SizedBox()),

        _buildWeekDays(),

        AnimatedSize(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
          child: Obx(() => controller.isExpanded.value
              ? _buildFullCalendar(controller)
              : _buildCurrentWeek(controller)),
        ),

        // Expand button
        _buildExpandButton(controller),
      ],
    );
  }

  Widget _buildHeader(HistoryCalendarController c) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () => c.changeMonth(-1), icon: const Icon(Icons.chevron_left)),
          Obx(() => Text(
            '${months[c.selectedMonth.value.month - 1]} ${c.selectedMonth.value.year}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          )),
          IconButton(onPressed: () => c.changeMonth(1), icon: const Icon(Icons.chevron_right)),
        ],
      ),
    );
  }

  Widget _buildWeekDays() {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: days
            .map((d) => Text(d, style: TextStyle(fontSize: 13, color: Colors.grey.shade600)))
            .toList(),
      ),
    );
  }


  Widget _buildCurrentWeek(HistoryCalendarController c) {

    final today = DateTime.now();
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(7, (i) {
          final date = startOfWeek.add(Duration(days: i));
          final dayData = c.getDayData(date.year, date.month, date.day);

          return Expanded(
            child: GestureDetector(
              onTap: () {
                c.selectedMonth.value = DateTime(date.year, date.month);
                c.selectDay(date.day);
              },
              child: Obx(() => CalendarDayWidget(
                day: date.day,
                dayData: dayData,
                isSelected: c.selectedDay.value == date.day &&
                    c.selectedMonth.value.month == date.month &&
                    c.selectedMonth.value.year == date.year,
                isLarge: true,
              )),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildFullCalendar(HistoryCalendarController c) {
    return Obx(() {
      final month = c.selectedMonth.value;
      final firstDay = DateTime(month.year, month.month, 1);
      final startingWeekday = firstDay.weekday;
      final daysInMonth = DateTime(month.year, month.month + 1, 0).day;

      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          childAspectRatio: 1.0,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 42,
        itemBuilder: (context, index) {
          if (index < startingWeekday - 1 || index >= startingWeekday - 1 + daysInMonth) {
            return const SizedBox.shrink();
          }

          final day = index - startingWeekday + 2;
          final dayData = c.getDayData(month.year, month.month, day);

          return GestureDetector(
            onTap: () => c.selectDay(day),
            child: Obx(() => CalendarDayWidget(
              day: day,
              dayData: dayData,
              isSelected: c.selectedDay.value == day,
              isLarge: false,
            )),
          );
        },
      );
    });
  }

  Widget _buildExpandButton(HistoryCalendarController c) {
    return GestureDetector(
      onTap: c.toggleExpanded,
      child: Obx(() => Icon(
        c.isExpanded.value ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
        size: 34,
        color: Colors.grey.shade600,
      )),
    );
  }
}