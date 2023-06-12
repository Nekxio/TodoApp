import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sizer/sizer.dart';

import '../../common/components/todoElement.dart';
import '../../common/layouts/defaultLayout.dart';
import '../../../utils/providers/provider.dart';

class HomeLayout extends ConsumerWidget {
  const HomeLayout({
    Key? key,
  }) : super(key: key);

  void _deleteTask(
      WidgetRef ref, DocumentReference<Map<String, dynamic>> taskRef, String taskId) async {
    final taskSnapshot = await taskRef.get();

    if (taskSnapshot.exists) {
      await taskRef.delete();

      ScaffoldMessenger.of(ref as BuildContext).showSnackBar(
        SnackBar(content: Text('La tâche avec l\'ID $taskId a été supprimée')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksCollection = ref.watch(tasksProvider);

    return DefaultLayout(
      body: Consumer(
        builder: (context, ref, _) {
          final tasksAsyncValue = ref.watch(taskListProvider);

          return tasksAsyncValue.when(
            loading: () => CircularProgressIndicator(),
            error: (error, stackTrace) => Text('Erreur : $error'),
            data: (tasks) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];

                        return Column(
                          children: [
                            TaskElement(
                              task: task,
                              onDismissed: (taskId) {
                                _deleteTask(ref, tasksCollection.doc(taskId), taskId);
                              },
                            ),
                            SizedBox(height: 2.h), // Ajoute un espace de 10 pixels
                          ],
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
