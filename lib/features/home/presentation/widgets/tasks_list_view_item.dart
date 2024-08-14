import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/utils/spacer.dart';

class TasksListViewItem extends StatefulWidget {
  const TasksListViewItem({
    super.key,
  });

  @override
  State<TasksListViewItem> createState() => _TasksListViewItemState();
}

class _TasksListViewItemState extends State<TasksListViewItem> {
  IconData icon = Icons.check_box_outline_blank_sharp;
  Color iconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 100.h,
        width: double.infinity,
        decoration: ShapeDecoration(
          color: const Color(0xFF8687E7),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(
                  () {
                    if (icon == Icons.check_box_outline_blank_sharp) {
                      icon = Icons.check_circle_outlined;
                      iconColor = const Color.fromARGB(255, 2, 132, 6);
                    } else {
                      icon = Icons.check_box_outline_blank_sharp;
                      iconColor = Colors.white;
                    }
                  },
                );
              },
              child: Icon(icon, size: 40, color: iconColor),
            ),
            horizontalSpace(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Do Math Homework',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                verticalSpace(6),
                Row(
                  children: [
                    Text(
                      'Today At 16:45',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    horizontalSpace(20),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF7F9BFF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.school_outlined,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          horizontalSpace(5),
                          Text(
                            'University',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                    horizontalSpace(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.flag_outlined),
                        horizontalSpace(5),
                        Text('1',
                            style: Theme.of(context).textTheme.titleSmall),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
