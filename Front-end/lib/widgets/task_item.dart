import '../model/tasks.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget{
  const TaskItem({super.key, required this.tarefa});
  final Tarefa tarefa;

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: Theme.of(context).primaryColor,
      child: InkWell(
        onTap: (){},
        child: Text(tarefa.titulo, style: TextStyle(color: Colors.white, fontSize: 20),),
      ),
    );
  }
}