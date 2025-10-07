import 'package:flutter/material.dart';
import '../data/tasks_data.dart';
import '../model/period.dart';
import '../screens/tasks_screens.dart';

DateTime agora = DateTime.now();
class PeriodItem extends StatelessWidget{
  const PeriodItem({super.key, required this.periodo});
  final Periodo periodo;

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              final tarefasFiltro = tarefas.where(
                (tarefa) => (tarefa.data.isBefore(DateTime(agora.year, agora.month, agora.day + periodo.dias)))
                ).toList();
                return TasksScreen(tarefas: tarefasFiltro, titulo: periodo.titulo);
            })
          );
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              periodo.cor.withValues(alpha: 0.5),
              periodo.cor.withValues(alpha: 0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          periodo.titulo,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w500
          ),
        ),
      )
    );
  }
}