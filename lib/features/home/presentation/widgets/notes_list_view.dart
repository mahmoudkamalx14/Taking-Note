import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/features/home/presentation/logic/note/note_cubit.dart';
import 'package:uptodo/features/home/presentation/logic/note/note_state.dart';
import 'package:uptodo/features/home/presentation/widgets/notes_list_view_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        var notesList = NoteCubit.get(context).notes;

        return Expanded(
          child: ListView.builder(
            itemCount: notesList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: NotesListViewItem(
                model: notesList[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
