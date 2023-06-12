import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/task_controller/taskModel.dart';

class TaskElement extends ConsumerStatefulWidget {
  const TaskElement({
    Key? key,
    required this.task,
    required this.onDismissed,
  }) : super(key: key);

  final Task task;
  final Function(String) onDismissed;

  @override
  _TaskElementState createState() => _TaskElementState();
}

class _TaskElementState extends ConsumerState<TaskElement> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.task.taskName),
      onDismissed: (direction) {
        widget.onDismissed(widget.task.taskName);
      },
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            SizedBox(
              width: 4,
            ),
          ],
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          color: isChecked ? Colors.green.shade100 : null,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  activeColor: Colors.green,
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.task.taskName.toUpperCase(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: isChecked ? Colors.green : Colors.black,
                      ),
                    ),
                    Text(widget.task.taskTag),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
