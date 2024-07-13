import 'package:flutter/material.dart';
import 'package:todo_cycle_8_session/core/shared_widgets/custom_button.dart';
import 'package:todo_cycle_8_session/core/shared_widgets/custom_field.dart';
import 'package:todo_cycle_8_session/core/utils/colors.dart';
import 'package:todo_cycle_8_session/featrues/home/data/models/note_model.dart';

class AddNoteBody extends StatefulWidget {
  const AddNoteBody({super.key});

  @override
  State<AddNoteBody> createState() => _AddNoteBodyState();
}

class _AddNoteBodyState extends State<AddNoteBody> {

  TextEditingController nameController  =TextEditingController();
  TextEditingController descController  =TextEditingController();
  DateTime datTimeNow = DateTime.now();

  DateTime? startDate = DateTime.now();  //
  DateTime?  endDate = DateTime.now(); //
  TimeOfDay?  time ;

  String convertDateString ( DateTime date ) {
    //2024-07-27 54df45d5d4
    // [ 2024-07-27   ,   54df45d5d4 ]

    return date.toString().split(" ")[0]  ;

  }

  String convertTime(TimeOfDay time ) {

    return  "${time.hour}:${time.minute} ${time.period.name}";

  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(22),
      children: [

        CustomTextField(
          minLine: 1,
          mxLine: 1,
          controller: nameController ,
          hintText: "Enter The Task Name",
          name: "Task Name",
        ),
          const SizedBox(height: 16,),
        CustomTextField(
          controller: descController,
          minLine: 3,
          mxLine: 6,
          name: "Description",
          hintText: "Enter a description",
        ),
        const SizedBox(height: 16,),
        ListTile(
          tileColor: Colors.white,


          title: Text("Start Date"),subtitle: Text(
          startDate == null? "Enter A Date":
        convertDateString(startDate!),
        style: TextStyle(
          color: Colors.grey
        ),
        )       ,
          trailing: IconButton(
            onPressed: ( ) async{

              startDate =await  showDatePicker(context: context, firstDate:datTimeNow, lastDate: datTimeNow.add(const Duration(
                days: 365,



              )),

              );
              setState(() {

              });

              print("start date ----> "+startDate.toString());


            } ,
            icon: Icon(Icons.arrow_circle_down_outlined),
          ),

          leading: Icon(Icons.date_range),

        ),
        SizedBox(height: 16,),

        ListTile(
            tileColor: Colors.white,
          title: Text("End Date"),subtitle: Text(

          endDate == null? "Enter A Date":
          convertDateString(endDate!),
          style: TextStyle(
              color: Colors.grey
          ),
        )       ,
          trailing: IconButton(
            onPressed: ( )  async {
              endDate =await  showDatePicker(context: context, firstDate:datTimeNow, lastDate: datTimeNow.add(const Duration(
                days: 365,

              )),
              );
              setState(() {

              });
            } ,
            icon: Icon(Icons.arrow_circle_down_outlined),
          ),
          leading: Icon(Icons.date_range),
        ),
        SizedBox(height: 16,),

        ListTile(
          tileColor: Colors.white,
          title: Text("Add Time"),subtitle: Text(
time == null ? "Add Time":
time!.format(context),
          style: TextStyle(
              color: Colors.grey
          ),
        )       ,
          trailing: IconButton(
            onPressed: ( )  async{
              time  =    await    showTimePicker(context: context, initialTime: TimeOfDay.now());

      setState(() {
      });


            } ,
            icon: Icon(Icons.arrow_circle_down_outlined),
          ),
          leading: Icon(Icons.time_to_leave),
        ),

        CustomButton(title: "Add Task",

        color: AppColors.mainColor,

        onPressed: ( ) {


      if(time!=null && startDate!=null &&endDate!=null && nameController.text.isNotEmpty && descController.text.isNotEmpty){
        notes.add(
            NoteModel(
                time: time!.format(context).toString(),
                startDate: convertDateString(startDate!),
                endDate: convertDateString(endDate!),
                title: nameController.text, desc: descController.text
            )

        );


        Navigator.pop(context);


      } else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Fill data")));
      }




        },
        )
      ],
    );
  }
}
