import 'package:flutter/material.dart';
import '../model/period.dart';
import '../screens/tasks_screen.dart';


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
                return TasksScreen(periodo: periodo, titulo: periodo.titulo, completas: false,);
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