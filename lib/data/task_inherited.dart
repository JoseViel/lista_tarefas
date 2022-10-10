import 'package:flutter/material.dart';
import '../components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task('Estudar Flutter', 'assets/images/boneco_flutter.png', 4),
    Task('Treinar', 'assets/images/treino.jpg', 3),
    Task('Comer', 'assets/images/comer.jpg', 2),
    Task('Faculdade', 'assets/images/faculdade.jpg', 5),
    Task('Jogar', 'assets/images/jogar.webp', 1),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(
      Task(name, photo, difficulty),
    );
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
