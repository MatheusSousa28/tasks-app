import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/task.dart';
import '../providers/tasks_provider.dart';
import '../data/image_service.dart';
import '../widgets/image_view_page.dart';

class TaskItem extends ConsumerWidget {
  const TaskItem({super.key, required this.tarefa});

  final Tarefa tarefa;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedTasks = ref.watch(completedTasksProvider);
    final isCompleted = completedTasks.contains(tarefa);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// imagem com o texto aqui
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                if (tarefa.imageFile != null)
                  GestureDetector(
                  onTap: () {
                      if (tarefa.imageFile != null &&
                          tarefa.imageFile!.existsSync()) {
                        Navigator.of(context).push(
                        MaterialPageRoute(
                      builder: (_) => ImageViewPage(
                              imageFile: tarefa.imageFile!,
                            ),
                          ),
                        );
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: (tarefa.imageFile != null &&
                              tarefa.imageFile!.existsSync())
                          ? Image.file(
                              tarefa.imageFile!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            )
                          : const Icon(
                              Icons.image_not_supported,
                              size: 60,
                            ),
                    ),
                  ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      tarefa.titulo,
                      style: TextStyle(
                      decoration: isCompleted
                              ? TextDecoration.lineThrough
                              : null,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (tarefa.descricao.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                           tarefa.descricao,
                           style: const TextStyle(
                           color: Colors.grey,
                           fontSize: 14,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            /// botoes
            Wrap(
              alignment: WrapAlignment.end,
              spacing: 8,
              runSpacing: 4,
              children: [
                IconButton(
                  tooltip: 'Concluir tarefa',
                  icon: Icon(
                    isCompleted
                     ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                  ),
                  onPressed: () {
                    ref
                        .read(completedTasksProvider.notifier)
                        .toggleTasksCompletedStatus(tarefa);
                  },
                ),
                IconButton(
                  tooltip: 'Selecionar da galeria',
                  icon: const Icon(Icons.photo_library),
                  onPressed: () async {
                    final image =
                        await ImageService.pickImageFromGallery();
                    if (image != null) {
                      tarefa.imageFile = image;
                      (context as Element).markNeedsBuild();
                    }
                  },


                ),
                IconButton(
                  tooltip: 'Tirar foto com a câmera',
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () async {
                    final image =
                      await ImageService.pickImageFromCamera();
                    if (image != null) {
                      tarefa.imageFile = image;
                      (context as Element).markNeedsBuild();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
