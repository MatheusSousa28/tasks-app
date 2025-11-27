import 'package:flutter/material.dart';
import '../screens/periods_screen.dart';
import 'tasks_screen.dart';
import '../screens/informations_screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
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
      activePage = TasksScreen(completas: false,);
      activePageTitle = 'Todas as tarefas';
    }
    else if (_indiceAtual == 2){
      activePage = TasksScreen(completas: true,);
      activePageTitle = 'Tarefas concluidas';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),), centerTitle: true,),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_rounded),
            label: 'Tarefas concluidas'
            ),
        ],
      ),
    );
  }
}