import 'package:flutter/cupertino.dart';
import 'package:note_app/models/noteModel.dart';
import 'package:note_app/widgets/colors_list_view.dart';
import 'package:note_app/widgets/constants.dart';

class EditNotesColorsList extends StatefulWidget {
  const EditNotesColorsList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNotesColorsList> createState() => _EditNotesColorsListState();
}

class _EditNotesColorsListState extends State<EditNotesColorsList> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kcolors.indexOf(Color(widget.note.color));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: kcolors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
            ),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color = kcolors[index].value;
                setState(() {});
              },
              child: ColorItem(
                color: kcolors[index],
                colorIsActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
