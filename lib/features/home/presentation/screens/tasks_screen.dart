import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/utils/spacer.dart';
import 'package:uptodo/features/home/presentation/logic/theme/theme_cubit.dart';
import 'package:uptodo/features/home/presentation/logic/theme/theme_state.dart';
import 'package:uptodo/features/home/presentation/widgets/tasks_list_view.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 12.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Hello my friend',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        ThemeCubit.get(context).emitThemeModeStates();
                      },
                      icon: Icon(
                        Icons.sunny,
                        size: 40,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                  ],
                ),
                verticalSpace(30),
                const TasksListView(),
              ],
            ),
          ),
        );
      },
    );
  }
}
