// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/features/home/data/models/caregory_model.dart';

import 'package:uptodo/features/home/presentation/widgets/gride_view_category_item.dart';

class GrideViewCategories extends StatelessWidget {
  GrideViewCategories({super.key});

  var items = categoriesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550.h,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12.h,
          crossAxisSpacing: 6.w,
          childAspectRatio: 7 / 9,
        ),
        itemBuilder: (context, index) => GrideViewCategoryItem(
          model: items[index],
        ),
        itemCount: items.length,
      ),
    );
  }
}
