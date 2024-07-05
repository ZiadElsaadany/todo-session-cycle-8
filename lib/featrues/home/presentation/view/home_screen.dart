import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_cycle_8_session/core/utils/colors.dart';
import 'package:todo_cycle_8_session/core/utils/images.dart';
import 'package:todo_cycle_8_session/featrues/add_note/presentation/view/add_note_screen.dart';
import 'package:todo_cycle_8_session/featrues/home/presentation/view/widgets/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.name, required this.photo});

  final String name ;
  final File photo;

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
          child: Column
            (
            children: [
              Text("ziad")
            ],
          ),
        ),
        body: Column(
          children: [
          CustomAppBar(name: name, photo: photo),
          Expanded(
            child: ListView.builder(

                 itemCount: 10,
                itemBuilder: (c,index) {
              return  Dismissible(
                background: Container(
                  child: Icon(Icons.delete),
                  color: Colors.red,
                ),
                key: GlobalKey(),
                child: ListTile(
                  trailing: Icon(Icons.add_a_photo    ),
                  leading: Icon(Icons.add),
                  title: Text("Studying Flutter"),
                  subtitle: Text("02:00 pm"),

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
