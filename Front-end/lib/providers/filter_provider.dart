import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'tasks_provider.dart';
import '../model/task.dart';

//provider do filtro, retorna o estado do filtro atual, inicializa cm pendentes
final filtroProvider = StateProvider<String>((ref) => 'Pendentes');

//provider que retorna as tarefas filtradas de acordo com o filtro atual
final filteredTasksProvider = Provider<List<Tarefa>>((ref) {
  final filtro = ref.watch(filtroProvider);
  final todas = ref.watch(allTasksProvider);
  final completas = ref.watch(completedTasksProvider);
  final pendentes = ref.watch(incompleteTasksProvider);

  switch (filtro) {
    case 'Todas':
      return todas;
    case 'Completas':
      return completas;
    default:
      return pendentes;
  }
});
