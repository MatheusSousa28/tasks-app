import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/task.dart';

//usando notifier mais moderno em vez do stateNotifier
class CompletedTasksNotifier extends Notifier<List<Tarefa>> {

  @override
  List<Tarefa> build() {//notifier depende desse metodo build obrigatório
    return [];//estado inicial
  }

  void toggleTasksCompletedStatus(Tarefa tarefa) {
    final taskIsCompleted = state.contains(tarefa);

    if (taskIsCompleted) {
      state = state.where((t) => t.id != tarefa.id).toList();
    } else {
      state = [...state, tarefa];
    }
  }
}

final completedTasksProvider =
    NotifierProvider<CompletedTasksNotifier, List<Tarefa>>(
  CompletedTasksNotifier.new,//new referencia o cosntrutor da classe como função, o ref é pego automaticamente
);
