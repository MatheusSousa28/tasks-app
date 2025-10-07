import 'package:flutter/material.dart';
import 'package:tasksapp/screens/home_page.dart';

void main() {
  runApp(const TasksApp());
}
final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(0, 180, 255, 255)
    ),
    fontFamily: 'arial',
);

class TasksApp extends StatelessWidget {
  const TasksApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskApp',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const HomePage(),
    );
  }
}

