
import 'package:hive/hive.dart';
part 'note_model.g.dart';
@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String desc;

  @HiveField(2)
  final String time ;

  @HiveField(3)
  final String startDate ;

  @HiveField(4)
  final String endDate ;

  @HiveField(5)
   bool archiveOrNot;

  @HiveField(6)
   bool doneOrNot;


  NoteModel(
  {

   required this.time,
   required this.startDate,
   required this.endDate,
   required this.title,
   required this.desc,
    this.archiveOrNot  =false,
    this.doneOrNot =false,
}
      );

}




