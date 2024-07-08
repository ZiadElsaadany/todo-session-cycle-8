
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../data/models/note_model.dart';

class ArchivedTasks extends StatefulWidget {
  const ArchivedTasks({super.key});

  @override
  State<ArchivedTasks> createState() => _ArchivedTasksState();
}

class _ArchivedTasksState extends State<ArchivedTasks> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Archived Tasks"),
      ),

      // body: ListView.builder(
      //
      //
      //     itemCount: notes.length,
      //     itemBuilder: (C,index) {
      //   return  ListTile(
      //     trailing: GestureDetector(
      //       onTap: ( ) {
      //
      //         setState(() {
      //           notes[index].doneOrNot = !notes[index].doneOrNot;
      //         });
      //
      //         // false - -> true
      //       },
      //       child: Container(
      //
      //           padding: const EdgeInsets.all(5),
      //           decoration: BoxDecoration(
      //               color: notes[index].doneOrNot ? AppColors.mainColor:Colors.white,
      //               border: Border.all(color:AppColors.mainColor ),
      //               borderRadius: BorderRadius.circular(10)
      //           ),
      //           child: Text("done")),
      //     ),
      //     leading: Icon(Icons.add),
      //     title: Text(notes[index].title),
      //     subtitle: Text(notes[index].time),
      //
      //   );
      // }),
    );
  }
}
