import 'package:flutter/material.dart';

class Periodo {
  const Periodo({
    required this.id,
    required this.titulo,
    this.cor = Colors.orange,
  });

  final String id;
  final String titulo;
  final Color cor;
}
