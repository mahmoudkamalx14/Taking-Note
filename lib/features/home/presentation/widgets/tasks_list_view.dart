import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/features/home/presentation/widgets/tasks_list_view_item.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: const TasksListViewItem(),
        ),
      ),
    );
  }
}
