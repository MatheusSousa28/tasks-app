import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/tasks_data.dart';
import '../model/task.dart';

class CompletedTasksNotifier extends StateNotifier<List<Tarefa>> {
  CompletedTasksNotifier() : super([]);

  void toggleTasksCompletedStatus(Tarefa tarefa) {
    final taskIsCompleted = state.contains(tarefa);

    if (taskIsCompleted) {
      state = state.where((t) => t.id != tarefa.id).toList();
    } else {
      state = [...state, tarefa];
    }
  }
}
//provider das tarefas completas
final completedTasksProvider =
  StateNotifierProvider<CompletedTasksNotifier, List<Tarefa>>((ref) {
    return CompletedTasksNotifier();
  });

//provider q retorna todas as tarefas, utilizado no filtro todas
final allTasksProvider = Provider<List<Tarefa>>((ref) {
  return tarefas;
});
//retorna somente as incompletas, usado no filtro tbm
final incompleteTasksProvider = Provider<List<Tarefa>>((ref) {
  final todas = ref.watch(allTasksProvider);
  final completas = ref.watch(completedTasksProvider);

  return todas.where((t) => !completas.contains(t)).toList();
});
