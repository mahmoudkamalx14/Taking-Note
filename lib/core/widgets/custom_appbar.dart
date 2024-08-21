import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/routes/routes.dart';
import 'package:uptodo/core/utils/extentions.dart';
import 'package:uptodo/core/utils/spacer.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.icon,
  });

  final String title;

  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            context.navigateToReplacement(Routes.navbarLayout);
          },
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: ShapeDecoration(
              color: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFECECEC)),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Icon(
              icon ?? Icons.arrow_back_ios_new_sharp,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ),
        horizontalSpace(40),
        Text(title, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
