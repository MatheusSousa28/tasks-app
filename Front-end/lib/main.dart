import 'package:flutter/material.dart';
import 'package:tasksapp/screens/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  runApp(
    const ProviderScope(
      child: TasksApp()
    ),
  );
}
final theme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: const ColorScheme.dark(
    surface: Colors.black,
    primary: Colors.white,
  ),
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

