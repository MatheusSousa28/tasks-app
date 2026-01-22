import 'dart:io';


enum Prioridade {baixa, media, alta}
class Tarefa{
   Tarefa({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.data,
    required this.prioridade
  });
  final String id;
  final String titulo;
  final String descricao;
  final DateTime data;
  final Prioridade prioridade;
  File? imageFile; // armazenar localmente a ft so enquanto não tem o firebase
}