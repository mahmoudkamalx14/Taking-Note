import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/utils/extentions.dart';
import 'package:uptodo/core/utils/spacer.dart';
import 'package:uptodo/core/widgets/app_text_button.dart';
import 'package:uptodo/core/widgets/app_text_form_field.dart';
import 'package:uptodo/core/widgets/custom_appbar.dart';
import 'package:uptodo/features/home/presentation/widgets/gride_view_categories.dart';
import 'package:uptodo/features/home/presentation/widgets/text_card.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 16.w),
          child: Column(
            children: [
              const CustomAppBar(title: 'Add Task'),
              verticalSpace(50),
              AppTextFormField(
                hintText: 'title',
                validator: (p0) {},
                textInputType: TextInputType.text,
              ),
              verticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextCard(
                    text: 'Category',
                    icon: Icons.school_outlined,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Choose Category'),
                            content: SizedBox(
                              width: double.maxFinite,
                              child: GrideViewCategories(),
                            ),
                            actions: <Widget>[
                              AppTextButton(
                                textButton: 'Add Category',
                                width: 180.w,
                                onPressed: () {
                                  context.pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  TextCard(
                    text: 'Time',
                    icon: Icons.av_timer,
                    onTap: () {},
                  ),
                ],
              ),
              verticalSpace(20),
              AppTextButton(
                textButton: 'Add Task',
                onPressed: () {},
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
