import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

import '../../../custom-widgets/Headers/header_text.dart';

// ignore: must_be_immutable
class ListTileCheck extends StatefulWidget {
  final String text;
  bool isActive;
  Function func;
  ListTileCheck(
      {Key? key,
      required this.text,
      required this.isActive,
      required this.func})
      : super(key: key);

  @override
  State<ListTileCheck> createState() => _ListTileCheckState();
}

class _ListTileCheckState extends State<ListTileCheck> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        listTiles(
            context: context,
            text: widget.text,
            isActive: widget.isActive,
            func: widget.func)
      ],
    );
  }
}

Widget listTiles(
    {required BuildContext context,
    required String text,
    required bool isActive,
    required func}) {
  return Container(
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: ListTile(
      onTap: () {
        func();
      },
      title: headerText(
          text: text,
          color: isActive ? MyColors.primaryColor : MyColors.negro,
          fontWeight: FontWeight.w300,
          fontSize: 17.0),
      trailing: isActive
          ? Icon(
              Icons.check,
              color: isActive ? MyColors.primaryColor : MyColors.gris,
            )
          : const Text(''),
    ),
  );
}
