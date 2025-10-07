import 'package:flutter/material.dart';
import '../widgets/task_item.dart';
import '../model/tasks.dart';

class TasksScreen extends StatelessWidget{
  const TasksScreen({super.key, required this.tarefas, required this.titulo});

  final String titulo;
  final List<Tarefa> tarefas;

  @override
  Widget build(BuildContext context){
    Widget content = Center(
      child: Text("Nada para mostrar", 
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme.of(context).colorScheme.onSurface,
        )),
    );
    if (tarefas.isNotEmpty){
      content = ListView.builder(
        itemCount: tarefas.length,
        itemBuilder: (context, index) => TaskItem(tarefa: tarefas[index]),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(titulo),
      ),
      body: Center(
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.87,
            child: content,
          ),
      ),
    );
  }
}