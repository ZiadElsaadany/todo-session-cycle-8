import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_cycle_8_session/featrues/home/data/models/note_model.dart';

import '../../../../core/utils/colors.dart';
import '../controller/home_controller.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title: const Text("Task Details"),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.noteModel.title),
            Text(widget.noteModel.desc),
            Text(widget.noteModel.startDate),
            Text(widget.noteModel.endDate),
            Text(widget.noteModel.time),

            SizedBox(height: 30,),

            MaterialButton(
              color: AppColors.mainColor,
              onPressed: ( ) {

Provider.of<HomeProvider>(context,listen: false).updateArchive(Provider.of<HomeProvider>(context).notes.indexOf(widget.noteModel));

              },child: Text(   Provider.of<HomeProvider>(context).notes[Provider.of<HomeProvider>(context).notes.indexOf(widget.noteModel)].archiveOrNot ?   "UnArchive":"Archive"),),
            MaterialButton(
              color: AppColors.mainColor,

              onPressed: ( ) {

                showDialog(context: context, builder: (c) {
                  return AlertDialog(

                   title: Column(
                     children: [
                       Text(" Are you sure you want to delete\nthis task?  "),
                       Row(
                         children: [
                           Expanded(
                             child: MaterialButton(onPressed: ( ) {
                               Navigator.pop(context);
                             },child: Text("Cancel"),),
                           ),
                           Expanded(
                             child: MaterialButton(onPressed: ( ) {
                               Provider.of<HomeProvider>(context).notes.removeAt(Provider.of<HomeProvider>(context).notes.indexOf(widget.noteModel));
                             Navigator.pop(context);
                             Navigator.pop(context);

                             
                             },child: Text("Delete"),),
                           ),
                         ],
                       )
                     ],
                   ),
                  );
                });


              },child: Text("Delete"),),
          ],
        ),
      ),
    );
    // archive  -->  unArchive
  }
}
