import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/utils/spacer.dart';
import 'package:uptodo/core/widgets/app_text_button.dart';
import 'package:uptodo/core/widgets/app_text_form_field.dart';
import 'package:uptodo/core/widgets/custom_appbar.dart';
import 'package:uptodo/features/home/logic/note_cubit.dart';
import 'package:uptodo/features/home/logic/note_state.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();

    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        var cubit = NoteCubit.get(context);
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 16.w),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const CustomAppBar(title: 'Add Note'),
                    verticalSpace(50),
                    AppTextFormField(
                      hintText: 'title',
                      textInputType: TextInputType.text,
                      controller: cubit.titleController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Title must be not empty';
                        }
                      },
                    ),
                    verticalSpace(20),
                    AppTextFormField(
                      hintText: 'title',
                      controller: cubit.contentController,
                      textInputType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Description must be not empty';
                        }
                      },
                    ),
                    verticalSpace(20),
                    AppTextButton(
                      textButton: 'Add Note',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.createNote();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
