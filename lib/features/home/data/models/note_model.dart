import 'package:uptodo/features/home/data/models/note_fields.dart';

class NoteModel {
  final int? id;
  final String title;
  final String content;
  final DateTime? createdTime;

  NoteModel({
    this.id,
    required this.title,
    required this.content,
    this.createdTime,
  });

  // تحويل الكائن إلى JSON، مع تحويل DateTime إلى String
  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.title: title,
        NoteFields.content: content,
        // تحويل DateTime إلى String
        NoteFields.createdTime: createdTime?.toIso8601String(),
      };

  // إنشاء كائن NoteModel من JSON، مع تحويل String إلى DateTime
  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json[NoteFields.id] as int?,
      title: json[NoteFields.title] as String,
      content: json[NoteFields.content] as String,
      // تحويل String إلى DateTime
      createdTime: json[NoteFields.createdTime] != null
          ? DateTime.parse(json[NoteFields.createdTime] as String)
          : null,
    );
  }

  // نسخة من الكائن مع القيم المحددة
  NoteModel copy({
    int? id,
    String? title,
    String? content,
    DateTime? createdTime,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdTime: createdTime ?? this.createdTime,
    );
  }
}
