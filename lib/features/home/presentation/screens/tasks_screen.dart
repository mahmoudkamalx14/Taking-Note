import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/utils/spacer.dart';
import 'package:uptodo/features/home/presentation/widgets/calendar_table.dart';
import 'package:uptodo/features/home/presentation/widgets/tasks_list_view.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 12.w),
        child: Column(
          children: [
            const CalendarTable(),
            verticalSpace(30),
            const TasksListView(),
          ],
        ),
      ),
    );
  }
}
