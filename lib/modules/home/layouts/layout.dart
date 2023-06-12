import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:todoapp/modules/common/components/todoElement.dart';

import '../../common/layouts/defaultLayout.dart';

class HomeLayout extends ConsumerWidget {
  const HomeLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      body: Column(
        children: [
          TodoElement(
            todoTitle: 'test',
            todoDate: DateTime.now(),
            todoDone: false,
          ),
          SizedBox(
            height: 2.h,
          ),
          TodoElement(
            todoTitle: 'test',
            todoDate: DateTime.now(),
            todoDone: false,
          ),
          SizedBox(
            height: 2.h,
          ),
          TodoElement(
            todoTitle: 'test',
            todoDate: DateTime.now(),
            todoDone: false,
          ),
          SizedBox(
            height: 2.h,
          ),
          TodoElement(
            todoTitle: 'test',
            todoDate: DateTime.now(),
            todoDone: false,
          ),
        ],
      ),
    );
  }
}
