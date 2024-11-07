import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/di/dependency_injection.dart';
import 'package:uptodo/core/utils/spacer.dart';
import 'package:uptodo/features/home/data/models/note_model.dart';
import 'package:uptodo/features/home/presentation/logic/note/note_cubit.dart';
import 'package:uptodo/features/home/presentation/logic/note/note_state.dart';

import 'update_note_widget.dart';

class NotesListViewItem extends StatelessWidget {
  const NotesListViewItem({super.key, required this.model});

  final NoteModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return BlocProvider(
              create: (context) => NoteCubit(getIt()),
              child: BlocBuilder<NoteCubit, NoteState>(
                builder: (context, state) {
                  return AlertDialog(
                    title: const Text('Update Note Details'),
                    content: SizedBox(
                      width: double.maxFinite,
                      height: 340.h,
                      child: UpdateNoteWidget(model: model),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
      child: Container(
        decoration: ShapeDecoration(
          color: Theme.of(context).hoverColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        width: double.infinity,
        height: 150.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.title,
                      style: Theme.of(context).textTheme.bodyLarge),
                  verticalSpace(12),
                  Expanded(
                    child: Text(
                      model.content,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  verticalSpace(12),
                  Text(
                    model.createdTime.toString().split(' ')[0],
                    //  DateFormat('yyyy-MM-dd').format(model.createdTime!),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            BlocBuilder<NoteCubit, NoteState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    deleteNote(context);
                  },
                  child: const Icon(Icons.delete_outline_outlined, size: 50),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void updateNote(BuildContext context) {}

  void deleteNote(BuildContext context) {
    NoteCubit.get(context).deleteNote(model.id!);
    NoteCubit.get(context).readAllNotes();
  }
}
