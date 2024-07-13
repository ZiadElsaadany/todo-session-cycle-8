import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_cycle_8_session/core/utils/colors.dart';
import 'package:todo_cycle_8_session/core/utils/images.dart';
import 'package:todo_cycle_8_session/featrues/add_note/presentation/view/add_note_screen.dart';
import 'package:todo_cycle_8_session/featrues/home/data/models/note_model.dart';
import 'package:todo_cycle_8_session/featrues/home/presentation/view/widgets/appbar.dart';
import 'package:todo_cycle_8_session/featrues/home/presentation/view/widgets/drawer_widge.dart';

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
            child:  notes.isEmpty?

                Center(child: Text("No Notes Yet!"))
                :      ListView.builder(

                 itemCount: notes.length,
                itemBuilder: (c,index) {
              return  Dismissible(
                background: Container(
                  child: Icon(Icons.delete),
                  color: Colors.red,
                ),
                key: GlobalKey(),
                child: ListTile(
                  trailing: GestureDetector(
                    onTap: ( ) {

                      setState(() {
                        notes[index].doneOrNot = !notes[index].doneOrNot;
                      });

                      // false - -> true
                    },
                    child: Container(

                      padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                        color: notes[index].doneOrNot ? AppColors.mainColor:Colors.white,
                          border: Border.all(color:AppColors.mainColor ),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text("done")),
                  ),
                  leading: Icon(Icons.add),
                  title: Text(notes[index].title),
                  subtitle: Text(notes[index].time),

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
