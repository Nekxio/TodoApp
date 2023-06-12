import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/task_controller/taskModel.dart';

final tasksProvider = Provider<CollectionReference<Map<String, dynamic>>>((ref) {
  return FirebaseFirestore.instance.collection('tasks');
});

void createTask(WidgetRef ref, Task newTask) {
  final tasksCollection = ref.read(tasksProvider);
  tasksCollection.add({
    'taskName': newTask.taskName,
    'taskDesc': newTask.taskDesc,
    'taskTag': newTask.taskTag,
  });
}

final taskListProvider = StreamProvider<List<Task>>((ref) {
  final tasksCollection = ref.watch(tasksProvider);
  return tasksCollection.snapshots().map((snapshot) {
    return snapshot.docs.map((doc) {
      final taskData = doc.data();
      return Task(
        taskName: taskData['taskName'] as String? ?? '',
        taskDesc: taskData['taskDesc'] as String? ?? '',
        taskTag: taskData['taskTag'] as String? ?? '',
      );
    }).toList();
  });
});
