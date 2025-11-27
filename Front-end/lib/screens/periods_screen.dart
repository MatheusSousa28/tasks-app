import 'package:flutter/material.dart';
import 'package:tasksapp/widgets/period_item.dart';
import '../data/tasks_data.dart';

class PeriodsScreen extends StatelessWidget{
  const PeriodsScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
        SizedBox(height: 80,),
        Center(
          child: SizedBox(
            height: 400, 
            width: MediaQuery.of(context).size.width * 0.9,
            child:  GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,//espaçamento horizontal
            mainAxisSpacing: 20,//espaçamento vertical
            childAspectRatio: 3/2,
            ),
            children: [
              for (final periodo in periodos)
                PeriodItem(periodo: periodo)
            ],
            ),
          ),
        ),
        ]
      ),
    );
  }
}