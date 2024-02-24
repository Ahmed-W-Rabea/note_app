import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/widgets/constants.dart';

class ColorItem extends StatelessWidget {
  const ColorItem(
      {super.key, required this.colorIsActive, required this.color});
  final bool colorIsActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: colorIsActive
          ? CircleAvatar(
              radius: 38,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 34,
                backgroundColor: color,
              ),
            )
          : CircleAvatar(
              radius: 38,
              backgroundColor: color,
            ),
    );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({
    super.key,
  });
  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

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
                BlocProvider.of<AddNoteCubit>(context).color = kcolors[index];
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
