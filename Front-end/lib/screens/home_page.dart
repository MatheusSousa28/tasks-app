import 'package:flutter/material.dart';
import '../screens/periods_screen.dart';
import '../screens/tasks_screens.dart';
import '../data/tasks_data.dart';
import '../screens/informations_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int _indiceAtual = 0;
  final List<Widget> _telas = [
    Center(child: PeriodsScreen()),
    Center(child: TasksScreen(tarefas: tarefas, titulo: 'Todas as tarefas')),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('TasksApp', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),), centerTitle: true,),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text('Informações do app e grupo'),
              onTap: () {
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
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (index) {
          setState(() {
            _indiceAtual = index;
          });
        },
        selectedItemColor: Colors.blueAccent,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Periodos'
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_rounded),
            label: 'Todas as tarefas'
            ),
        ],
      ),
    );
  }
}