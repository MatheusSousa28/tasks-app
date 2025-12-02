import 'package:flutter/material.dart';
import '../widgets/task_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/filter_provider.dart';
import '../model/period.dart';
import '../data/tasks_data.dart';

class TasksScreen extends ConsumerStatefulWidget {
  const TasksScreen({super.key, this.periodo, this.titulo});

  final Periodo? periodo;
  final String? titulo;

  @override
  ConsumerState<TasksScreen> createState() => _TasksScreenState();
}
class _TasksScreenState extends ConsumerState<TasksScreen> {

  @override
  void initState() {
    super.initState();
    //quando a página n recebe um periodo
    if (widget.periodo != null) {
      Future.microtask(() {//microTask faz com q o estado seja mudado imediatamente após o build
        ref.read(filtroProvider.notifier).state = "Pendentes";//estado do filtro mostra somente as tarefas pendentes
      });
    }
  }

  @override
  Widget build(BuildContext context){
    var tasks = ref.watch(filteredTasksProvider);//retorna a lista de tarefas com base no filtro atual
    final filtro = ref.watch(filtroProvider);//retorna o filtro atual
    if (widget.periodo != null){//se a página recebeu um periodo
      final limite = agora.add(Duration(days: widget.periodo!.dias));//pegando a data limite do periodo
      tasks = tasks.where((tarefa) {
        //retorna as tarefas que estão antes e extamente na data limite
        return tarefa.data.isBefore(limite) || tarefa.data.isAtSameMomentAs(limite);
      }).toList();
    }
    Widget content = Center(
      child: Text("Nada para mostrar", 
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme.of(context).colorScheme.onSurface,
        )),
    );
    if (tasks.isNotEmpty || widget.periodo == null){//esse bloco acontece se n existe tarefas ou se n tem periodo
      content = Column(
        children: [
          if (widget.periodo == null)//se a pagina n recebeu periodo, constroi uma row com os botões de filtro
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //cada botão quando é prssionado muda o filtro
                  ElevatedButton(
                    onPressed:() {
                      ref.read(filtroProvider.notifier).state = "Pendentes";
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: filtro == 'Pendentes' ? Colors.blueAccent : Colors.black,
                      padding: EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        )
                      )
                    ),
                    child: Text("Pendentes", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: filtro == 'Pendentes' ? Colors.black : Colors.blueAccent,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed:() {
                      ref.read(filtroProvider.notifier).state = 'Completas';
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: filtro == 'Completas' ? Colors.blueAccent : Colors.black,
                      padding: EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        )
                      )
                    ),
                    child: Text("Completas", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: filtro == 'Completas' ? Colors.black : Colors.blueAccent,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed:() {
                      ref.read(filtroProvider.notifier).state = "Todas";
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: filtro == 'Todas' ? Colors.blueAccent : Colors.black,
                      padding: EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        )
                      )
                    ),
                    child: Text("Todas", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: filtro == 'Todas' ? Colors.black : Colors.blueAccent,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ),
            tasks.isEmpty ?//se n tem tarefas
              Center(
                child: Text("Nada para mostrar", 
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  )),
              ) 
              : Expanded(//se tem tarefas, constrói a listview
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) => TaskItem(tarefa: tasks[index]),
                )
              )
        ]
      );
    }

    if (widget.titulo == null){
	    return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo!),
      ),
      body: content,
    );
  }
}

