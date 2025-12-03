import '../model/task.dart';
import 'package:flutter/material.dart';
import 'package:tasksapp/providers/tasks_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class TaskItem extends ConsumerWidget{
  const TaskItem({super.key, required this.tarefa});
  final Tarefa tarefa;

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final completedTasks = ref.watch(completedTasksProvider);
    final isCompleted = completedTasks.contains(tarefa);//flag que vai ditar o estilo da tarefa
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: Theme.of(context).colorScheme.surface,
      child: ListTile(
        title: isCompleted ? Text(
          tarefa.titulo,
          style: const TextStyle(
            decoration: TextDecoration.lineThrough,
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        )
        : Text(
          tarefa.titulo,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            isCompleted ? Icons.check_circle_outline_rounded  : Icons.radio_button_unchecked_rounded,
            color: Theme.of(context).colorScheme.primary),
          onPressed: () {
            ref.read(completedTasksProvider.notifier)
              .toggleTasksCompletedStatus(tarefa);
          },
        ),
        onTap: () {},
      ),
    );
  }
}