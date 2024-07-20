
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_cycle_8_session/featrues/home/presentation/view/task_details.dart';

import '../../../../core/utils/colors.dart';
import '../../data/models/note_model.dart';
import '../controller/home_controller.dart';

class ArchivedTasks extends StatefulWidget {
  const ArchivedTasks({super.key});

  @override
  State<ArchivedTasks> createState() => _ArchivedTasksState();
}

class _ArchivedTasksState extends State<ArchivedTasks> {

  @override
  Widget build(BuildContext context) {

    List<NoteModel>  archivedTasks  = Provider.of<HomeProvider>(context).notes.where((element) => element.archiveOrNot == true).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Archived Tasks"),
      ),

      body: ListView.builder(


          itemCount: archivedTasks.length,
          itemBuilder: (C,index) {
        return  ListTile(
          onTap: ( ) {
            Navigator.push(context, MaterialPageRoute(builder: (C) {
              return TaskDetails( noteModel: archivedTasks[index] ,);
            } )).then((value) =>setState(() {}));
          },          leading: Icon(Icons.add),

          title: Text(archivedTasks[index].title),
          subtitle: Text(archivedTasks[index].time),

        );
      }),
    );
  }
}
