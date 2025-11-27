import 'package:flutter/material.dart';
import '../widgets/task_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasksapp/providers/completeds_provider.dart';
import '../model/period.dart';
import '../data/tasks_data.dart';


class TasksScreen extends ConsumerWidget{
  const TasksScreen({super.key, this.periodo, this.titulo, required this.completas});

  final String? titulo;
  final Periodo? periodo;
  final bool completas;

  @override
  Widget build(BuildContext context, WidgetRef ref){
    var tasks = ref.watch(completedTasksProvider);
    if (!completas){
      tasks = tarefas.where((t) => !tasks.contains(t)).toList();//pegando somente as incompletas
    }
    if (periodo != null){
      tasks = tasks.where(//fazendo o filtro por periodo
      (tarefa) => (tarefa.data.isBefore(DateTime(agora.year, agora.month, agora.day + periodo!.dias)) )
      ).toList();
    }
    Widget content = Center(
      child: Text("Nada para mostrar", 
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme.of(context).colorScheme.onSurface,
        )),
    );
    if (tasks.isNotEmpty){
      content = ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => TaskItem(tarefa: tasks[index]),
      );
    }

    if (titulo == null){
	    return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(titulo!),
      ),
      body: content,
    );
  }
}