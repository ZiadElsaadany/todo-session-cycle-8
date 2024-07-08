import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../data/models/note_model.dart';

class DoneTasks extends StatefulWidget {
  const DoneTasks({super.key});

  @override
  State<DoneTasks> createState() => _DoneTasksState();
}

class _DoneTasksState extends State<DoneTasks> {
  List<NoteModel> doneList =
      notes.where((element) => element.doneOrNot == true).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Done Tasks"),
      ),
      body:doneList.isEmpty ? Center(child: Text('No Done Items')): ListView.builder(
          itemCount: doneList.length,
          itemBuilder: (C, index) {
            return ListTile(
              leading: Icon(Icons.add),
              title: Text(doneList[index].title),
              subtitle: Text(doneList[index].time),
            );
          }),
    );
  }
}
