import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_cycle_8_session/core/utils/colors.dart';
import 'package:todo_cycle_8_session/core/utils/images.dart';
import 'package:todo_cycle_8_session/featrues/add_note/presentation/view/add_note_screen.dart';
import 'package:todo_cycle_8_session/featrues/home/data/models/note_model.dart';
import 'package:todo_cycle_8_session/featrues/home/presentation/view/task_details.dart';
import 'package:todo_cycle_8_session/featrues/home/presentation/view/widgets/appbar.dart';
import 'package:todo_cycle_8_session/featrues/home/presentation/view/widgets/drawer_widge.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.name, required this.photo});

  final String name ;
  final File photo;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    List<NoteModel>   unArchiveNotes =Provider.of<HomeProvider>(context).notes.where((element) =>element.archiveOrNot==false).toList();
    return  SafeArea(
      child: Scaffold(
        floatingActionButtonLocation:     FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          onPressed: ( ){

            // showModalBottomSheet(context: context, builder: (c) {
            //   return Text("zzz") ;
            // });



            Navigator.push(context, MaterialPageRoute(builder: (c) {
              return  AddNoteScreen();
            } ));


          },
          child: Icon(Icons.add),
        ),


        drawer: Drawer(
          child: CustomDrawer(),
        ),
        body: Column(
          children: [
          CustomAppBar(name: widget.name, photo: widget.photo),
          Expanded(
            child:  unArchiveNotes.isEmpty?


                const Center(child: Text("No Notes Yet!"))
                :      ListView.builder(

                 itemCount: unArchiveNotes.length,
                itemBuilder: (c,index) {
              return  Dismissible(
                background: Container(
                  child: Icon(Icons.delete),
                  color: Colors.red,
                ),
                key: GlobalKey(),
                child: ListTile(
                  onTap: ( ) {
                    Navigator.push(context, MaterialPageRoute(builder: (C) {
                      return TaskDetails( noteModel: unArchiveNotes[index] ,);
                    } )).then((value) =>setState(() {

                    }));
                  },
                  trailing: GestureDetector(
                    onTap: ( ) {

                      setState(() {
                        unArchiveNotes[index].doneOrNot = !unArchiveNotes[index].doneOrNot;
                      });

                      // false - -> true
                    },
                    child: Container(

                      padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                        color: unArchiveNotes[index].doneOrNot ? AppColors.mainColor:Colors.white,
                          border: Border.all(color:AppColors.mainColor ),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text("done")),
                  ),
                  leading: Icon(Icons.add),
                  title: Text(unArchiveNotes[index].title),
                  subtitle: Text(unArchiveNotes[index].time),

                ),
              );
            }),
          )

          ],
        ),
      ),
    );
  }
}


