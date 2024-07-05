
import 'package:flutter/material.dart';
import 'package:todo_cycle_8_session/featrues/add_note/presentation/view/widgets/add_note_body.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.abc),
        title: const Text("Add Task"),
      ),
      body: AddNoteBody(),
    );
  }
}
