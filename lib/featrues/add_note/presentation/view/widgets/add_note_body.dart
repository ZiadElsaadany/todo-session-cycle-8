import 'package:flutter/material.dart';
import 'package:todo_cycle_8_session/core/shared_widgets/custom_field.dart';

class AddNoteBody extends StatefulWidget {
  const AddNoteBody({super.key});

  @override
  State<AddNoteBody> createState() => _AddNoteBodyState();
}

class _AddNoteBodyState extends State<AddNoteBody> {

  TextEditingController nameController  =TextEditingController();
  TextEditingController descController  =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(22),
      children: [

        CustomTextField(
          controller: nameController ,
          hintText: "Enter The Task Name",
          name: "Task Name",
        ),
          SizedBox(height: 16,),
        CustomTextField(
          controller: descController,
          minLine: 3,
          mxLine: 6,
          name: "Description",
          hintText: "Enter a description",
        ),
        SizedBox(height: 16,),
        ListTile(
          tileColor: Colors.white,

          title: Text("Start Date"),subtitle: Text("30 june, 2022",
        style: TextStyle(
          color: Colors.grey
        ),
        )       ,
          trailing: IconButton(
            onPressed: ( ) {

              showDatePicker(context: context, firstDate: DateTime.now(), lastDate:  DateTime.now().add(Duration(
                days: 365,

              )));


            } ,
            icon: Icon(Icons.arrow_circle_down_outlined),
          ),

          leading: Icon(Icons.date_range),

        ),
        SizedBox(height: 16,),

        ListTile(
            tileColor: Colors.white,
          title: Text("End Date"),subtitle: Text("30 june, 2022",
          style: TextStyle(
              color: Colors.grey
          ),
        )       ,
          trailing: IconButton(
            onPressed: ( ) {
              showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(
                days: 365,

              )));
            } ,
            icon: Icon(Icons.arrow_circle_down_outlined),
          ),
          leading: Icon(Icons.date_range),
        ),
        SizedBox(height: 16,),

        ListTile(
          tileColor: Colors.white,
          title: Text("Add Time"),subtitle: Text("11:00 pm",
          style: TextStyle(
              color: Colors.grey
          ),
        )       ,
          trailing: IconButton(
            onPressed: ( ) {
             showTimePicker(context: context, initialTime: TimeOfDay.now());
            } ,
            icon: Icon(Icons.arrow_circle_down_outlined),
          ),
          leading: Icon(Icons.time_to_leave),
        ),
      ],
    );
  }
}
