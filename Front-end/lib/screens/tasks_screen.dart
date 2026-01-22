import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/task_item.dart';
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

    if (widget.periodo != null) {
      Future.microtask(() {
        ref.read(filtroProvider.notifier).state = "Pendentes";
      });
       }}

  @override
  Widget build(BuildContext context) {
    var tasks = ref.watch(filteredTasksProvider);
    final filtro = ref.watch(filtroProvider);


    if (widget.periodo != null) {
      final limite =
        agora.add(Duration(days: widget.periodo!.dias));
      tasks = tasks.where((tarefa) {
        return tarefa.data.isBefore(limite) ||
            tarefa.data.isAtSameMomentAs(limite);
      }).toList();
    }

    Widget content = Center(
      child: Text(
        "Nada para mostrar",
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ), );

    if (tasks.isNotEmpty || widget.periodo == null) {
      content = Column(
        children: [
          
             if (widget.periodo == null)
               Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                   runSpacing: 8,
                children: [
                  _filterButton(
                    context,
                    label: "Pendentes",
                    isSelected: filtro == "Pendentes",
                    onPressed: () {
                      ref.read(filtroProvider.notifier).state =
                          "Pendentes";
                    },
                  ),
                  _filterButton(
                    context,
                    label: "Completas",
                      isSelected: filtro == "Completas",
                    onPressed: () {
                      ref.read(filtroProvider.notifier).state =
                          "Completas";
                    },
                  ),
                  _filterButton(
                      context,
                    label: "Todas",
                    isSelected: filtro == "Todas",
                     onPressed: () {
                      ref.read(filtroProvider.notifier).state =
                          "Todas";
                    },
                  ),
                ],
              ),
            ),

      
          tasks.isEmpty
              ? Center(
                  child: Text(
                    "Nada para mostrar",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface,
                        ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) =>
                        TaskItem(tarefa: tasks[index]),
                  ),
                ),
        ],
      );
    }

    if (widget.titulo == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo!),
      ),
      body: content,
    );
  }
  Widget _filterButton(
    BuildContext context, {
    required String label,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 2,
          ),
        ),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: isSelected
                  ? Theme.of(context).colorScheme.surface
                  : Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

