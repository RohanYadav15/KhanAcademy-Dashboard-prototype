import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khan_academy_dashboard/utils/constants.dart';

class TaskTile extends StatefulWidget {
  final String taskName;
  final String taskSubtitle;
  const TaskTile({Key? key, required this.taskName, required this.taskSubtitle})
      : super(key: key);

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isDone,
      onChanged: (value) => setState(() => isDone = value ?? false),
      title: Text(
        widget.taskName,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: isDone ? kTextColor.withOpacity(0.6) : kTextColor,
          decoration: isDone ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      subtitle: Text(
        widget.taskSubtitle,
        style: TextStyle(
          fontStyle: FontStyle.italic,
          color: isDone ? kTextColor.withOpacity(0.6) : kTextColor,
        ),
      ),
      activeColor: kSecondaryColor.withOpacity(0.6),
      checkColor: kButtonColor,
      tileColor: kSecondaryColor,
    );
  }
}
