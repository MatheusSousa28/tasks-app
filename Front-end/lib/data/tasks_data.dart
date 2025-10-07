import 'package:flutter/material.dart';
import '../model/period.dart';
import '../model/tasks.dart';

const periodos = [
  Periodo(id: 'p1', titulo: 'Hoje', cor: Colors.red),
  Periodo(id: 'p2', titulo: 'Semana', cor: Colors.orange),
  Periodo(id: 'p3', titulo: '15 dias', cor: Colors.yellow),
  Periodo(id: 'p4', titulo: 'Mês', cor: Colors.green),
];
DateTime agora = DateTime.now();

final tarefas = [
  Tarefa(
    id: 't1',
    titulo: 'Reunião na empresa',
    descricao: 'ser pontual',
    data: agora.add(Duration(days: 7)),
    prioridade: Prioridade.importante,
  ),
  Tarefa(
    id: 't2',
    titulo: 'Almoço com a familia',
    descricao: '',
    data: agora.add(Duration(days: 3)),
    prioridade: Prioridade.normal,
  ),
  Tarefa(
    id: 't3',
    titulo: 'Rolê com os amigos',
    descricao: '',
    data: agora.add(Duration(days: 18)),
    prioridade: Prioridade.opcional,
  ),
  Tarefa(
    id: 't4',
    titulo: 'Prova de matemática',
    descricao: 'estudar os assuntos pendentes',
    data: agora.add(Duration(days: 30)),
    prioridade: Prioridade.critica,
  ),
  Tarefa(
    id: 't5',
    titulo: 'Estudar programação móvel',
    descricao: '',
    data: agora.add(Duration(hours: 5)),
    prioridade: Prioridade.importante,
  ),
  Tarefa(
    id: 't6',
    titulo: 'Aniversário da kelly',
    descricao: 'vai ser legal',
    data: agora.add(Duration(days: 10)),
    prioridade: Prioridade.opcional,
  ),
  Tarefa(
    id: 't7',
    titulo: 'Buscar o carro na oficina',
    descricao: '',
    data: agora.add(Duration(days: 1)),
    prioridade: Prioridade.importante,
  ),
  Tarefa(
    id: 't8',
    titulo: 'Apresentação do trabalho',
    descricao: 'revisar conteúdo antes',
    data: agora.add(Duration(days: 4)),
    prioridade: Prioridade.importante,
  ),
  Tarefa(
    id: 't9',
    titulo: 'Próxima consulta',
    descricao: '',
    data: agora.add(Duration(days: 23)),
    prioridade: Prioridade.normal,
  ),
  Tarefa(
    id: 't10',
    titulo: 'Show de música',
    descricao: '',
    data: agora.add(Duration(days: 9)),
    prioridade: Prioridade.normal,
  ),
];