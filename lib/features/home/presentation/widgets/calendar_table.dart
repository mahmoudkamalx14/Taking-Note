import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarTable extends StatefulWidget {
  const CalendarTable({
    super.key,
  });

  @override
  State<CalendarTable> createState() => _CalendarTableState();
}

class _CalendarTableState extends State<CalendarTable> {
  DateTime? selectedDay;
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2024, 6, 10),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: focusedDay,
      daysOfWeekHeight: 60.h,
      rowHeight: 70.h,
      calendarFormat: CalendarFormat.week,
      selectedDayPredicate: (day) {
        return isSameDay(selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          this.selectedDay = selectedDay;
          this.focusedDay = focusedDay;
        });
      },
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: Theme.of(context).textTheme.bodyLarge!,
        rightChevronIcon: Icon(
          Icons.arrow_forward_ios_outlined,
          color: Theme.of(context).iconTheme.color,
        ),
        leftChevronIcon: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      dayHitTestBehavior: HitTestBehavior.opaque,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: Theme.of(context).textTheme.bodyMedium!,
        weekendStyle: Theme.of(context).textTheme.bodyMedium!,
      ),
      calendarStyle: CalendarStyle(
        todayTextStyle: Theme.of(context).textTheme.bodyLarge!,
        selectedTextStyle: Theme.of(context).textTheme.bodyLarge!,
        weekendTextStyle: Theme.of(context).textTheme.bodyLarge!,
        todayDecoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        ),
        defaultTextStyle: Theme.of(context).textTheme.bodyLarge!,
        selectedDecoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
