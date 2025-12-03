import 'package:flutter/material.dart';
import '../screens/periods_screen.dart';
import 'tasks_screen.dart';
import '../screens/informations_screen.dart';
import '../providers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>{
  int _indiceAtual = 0;
  void _selectPage(int index){
    setState(() {
      _indiceAtual = index;
    });
  }

  @override
  Widget build(BuildContext context){
    Widget activePage = const PeriodsScreen();
    var activePageTitle = 'TaskApp';
    if (_indiceAtual == 1){
      activePage = TasksScreen();
      activePageTitle = 'Todas as tarefas';
    }

     final themeMode = ref.watch(themeNotifierProvider);
     final isDark = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),), centerTitle: true, actions: [
          IconButton(
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleTheme();
            },
          ),
        ],),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text('Informações do app e grupo'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context){
                      return InformationsScreen();
                    }
                    )
                  );
              },
            ),
          ],
        ),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: _selectPage,
        selectedItemColor: Colors.blueAccent,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded),
            label: 'Periodos'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_rounded),
            label: 'Todas as tarefas'
          ),
        ],
      ),
    );
  }
}