enum Prioridade {baixa, media, alta}
class Tarefa{
  const Tarefa({
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
}