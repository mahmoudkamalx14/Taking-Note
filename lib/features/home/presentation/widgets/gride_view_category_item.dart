import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/utils/spacer.dart';
import 'package:uptodo/features/home/data/models/caregory_model.dart';

class GrideViewCategoryItem extends StatelessWidget {
  const GrideViewCategoryItem({super.key, required this.model});

  final CaregoryModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: 84.w,
            height: 84.h,
            decoration: ShapeDecoration(
              color: model.color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: Icon(model.icon),
          ),
          verticalSpace(12),
          Text(model.text, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
