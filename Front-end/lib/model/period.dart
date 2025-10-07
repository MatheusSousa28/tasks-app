import 'package:flutter/material.dart';

class Periodo {
  const Periodo({
    required this.id,
    required this.titulo,
    required this.dias,
    this.cor = Colors.orange,
  });

  final String id;
  final String titulo;
  final int dias;
  final Color cor;
}
