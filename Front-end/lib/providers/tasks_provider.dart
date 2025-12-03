import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/tasks_data.dart';
import '../model/task.dart';

class CompletedTasksNotifier extends StateNotifier<List<Tarefa>> {
  CompletedTasksNotifier() : super([]) {
    _loadCompletedTasks();//chamando a funcao q carregas as tarefas do shared logo no cosntrutor
  }
  Future<void> _loadCompletedTasks() async {
    final prefs = await SharedPreferences.getInstance();
    //carrega a lista de ids das tarefas completas
    final ids = prefs.getStringList('completedTasks') ?? [];
    //converte esses ids em tarefas
    final completedTasks = tarefas.where((t) => ids.contains(t.id)).toList();
    state = completedTasks;//colocando as tarefas no estado
  }

  void toggleTasksCompletedStatus(Tarefa tarefa) {
    final taskIsCompleted = state.contains(tarefa);

    if (taskIsCompleted) {
      state = state.where((t) => t.id != tarefa.id).toList();
    } else {
      state = [...state, tarefa];
    }
    _saveCompletedTasks();//salva a nova tarefa no shared
  }

  Future<void> _saveCompletedTasks() async {
    final prefs = await SharedPreferences.getInstance();
    //pegando os ids das tarefas completas como uma lista e salvando no shared
    final ids = state.map((t) => t.id).toList();
    prefs.setStringList('completedTasks', ids);
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
