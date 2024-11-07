import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/di/dependency_injection.dart';
import 'package:uptodo/core/utils/extentions.dart';
import 'package:uptodo/core/utils/spacer.dart';
import 'package:uptodo/core/widgets/app_text_button.dart';
import 'package:uptodo/core/widgets/app_text_form_field.dart';
import 'package:uptodo/features/home/data/models/note_model.dart';
import 'package:uptodo/features/home/presentation/logic/note/note_cubit.dart';
import 'package:uptodo/features/home/presentation/logic/note/note_state.dart';

class UpdateNoteWidget extends StatelessWidget {
  const UpdateNoteWidget({super.key, required this.model});

  final NoteModel model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(getIt()),
      child: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          var cubit = NoteCubit.get(context);
          cubit.titleController.text = model.title;
          cubit.contentController.text = model.content;
          GlobalKey<FormState> formKey = GlobalKey();
          return Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Column(
                children: [
                  AppTextFormField(
                    hintText: 'Title',
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
                    hintText: 'Content',
                    controller: cubit.contentController,
                    textInputType: TextInputType.text,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Content must be not empty';
                      }
                    },
                  ),
                  const Spacer(),
                  AppTextButton(
                    textButton: 'UPDATE',
                    width: double.infinity,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        NoteCubit.get(context).updateNote();
                        context.pop();
                        NoteCubit.get(context).readAllNotes();
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
