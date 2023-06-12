import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:todoapp/modules/common/ui/bottomNavigationBar.dart';

import '../../../models/task_controller/taskModel.dart';
import '../../../utils/providers/provider.dart';

class DefaultLayout extends ConsumerWidget {
  const DefaultLayout({
    Key? key,
    required this.body,
  }) : super(key: key);

  final Widget body;

  void _showCreateTaskDialog(BuildContext context, WidgetRef ref) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    final TextEditingController tagController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Nouvelle tâche'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Titre'),
              ),
              TextField(
                controller: descController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: tagController,
                decoration: const InputDecoration(labelText: 'Tag'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                final String title = titleController.text;
                final String desc = descController.text;
                final String tag = tagController.text;

                if (title.isNotEmpty && desc.isNotEmpty && tag.isNotEmpty) {
                  createTask(ref, Task(
                    taskName: title,
                    taskDesc: desc,
                    taskTag: tag,
                  ));

                  Navigator.of(context).pop();
                }
              },
              child: const Text('Créer'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Annuler'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TodoApp'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Consumer(
                builder: (context, ref, child) {
                  return body;
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
        child: const AppBottomNavigationBar(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCreateTaskDialog(context, ref);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
