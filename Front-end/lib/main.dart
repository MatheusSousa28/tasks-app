import 'package:flutter/material.dart';
import 'package:tasksapp/screens/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasksapp/providers/theme_provider.dart';
import 'package:tasksapp/screens/tela_login.dart';


void main() {
  runApp(
    const ProviderScope(
      child: TasksApp()
    ),
  );
}

class TasksApp extends ConsumerWidget {
  const TasksApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,  WidgetRef ref) {
     final themeMode = ref.watch(themeNotifierProvider);

    return MaterialApp(
      title: 'TaskApp',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,

      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          surface: Colors.white,
          primary: Colors.black,
          secondary: Color.fromARGB(255, 0, 75, 204)
        ),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(
          surface: Colors.black,
          primary: Colors.white,
          secondary: Color.fromARGB(255, 0, 75, 204)
        ),
      ),
      home: const TelaLogin(),
    );
  }
}

