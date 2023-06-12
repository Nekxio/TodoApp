import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../models/task_controller/taskModel.dart';

class TaskElement extends StatelessWidget {
  const TaskElement({
    Key? key,
    required this.task,
    required this.onDismissed,
  }) : super(key: key);

  final Task task;
  final Function(String) onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.taskName),
      onDismissed: (direction) {
        onDismissed(task.taskName);
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
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Checkbox(
                value: false,
                onChanged: (value) {
                  // TODO: Implement checkbox logic
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                activeColor: Colors.green,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    task.taskName.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(task.taskTag),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
