import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

class TodoElement extends ConsumerStatefulWidget {
  const TodoElement({
    Key? key,
    required this.todoTitle,
    required this.todoDate,
    required this.todoDone,
  }) : super(key: key);

  final String todoTitle;
  final DateTime todoDate;
  final bool todoDone;

  @override
  ConsumerState createState() => _TodoElementState();
}

class _TodoElementState extends ConsumerState<TodoElement> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.todoTitle),
      //onDismissed: (direction) {
      //setState(() {
      //items.removeAt(index);
      //});

      //ScaffoldMessenger.of(context)
      //  .showSnackBar(SnackBar(content: Text('$item dismissed')));
      //},
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(
              Icons.delete,
              color: Colors.white,
            ),
            SizedBox(
              width: 4.w,
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
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Checkbox(
                value: false,
                onChanged: (value) {
                  setState(() {});
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
                  Text(widget.todoTitle.toUpperCase(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                    widget.todoDate.toString(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
