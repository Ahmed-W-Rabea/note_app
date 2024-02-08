import 'package:flutter/material.dart';
import 'package:note_app/widgets/add_note_buttom_sheet.dart';
import 'package:note_app/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: const Color.fromARGB(255, 105, 226, 243),
        foregroundColor: Colors.black,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return AddNoteButtomSheet();
              });
        },
        child: Icon(Icons.add),
      ),
      body: const NotesViewBody(),
    );
  }
}
