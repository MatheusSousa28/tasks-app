import 'package:flutter/material.dart';

class InformationsScreen extends StatelessWidget{
  const InformationsScreen({super.key});

  @override
  Widget build(BuildContext content){
    return Scaffold(
      appBar: AppBar(title: Text('Informações do app e grupo')),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Text('Informações do app', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          SizedBox(height: 20,),
          Text('Este é um aplicativo de tarefas, que implementa as funcionalidades apresentadas em aula na disciplina de programação móvel do curso de Análise e Desenvolvimento de Sistemas. A aplicação foca em seguir os conceitos e fundamentos presentes na disciplina.', 
          style: TextStyle(fontSize: 16), textAlign: TextAlign.center,),
          SizedBox(height: 40,),
          Text('Participantes do grupo', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          SizedBox(height: 20,),
          SizedBox(height: 20,),
          Text('Matheus Sousa', style: TextStyle(fontSize: 18)),
          Text('Andreza Pinho', style: TextStyle(fontSize: 18)),
          Text('Roger Brito', style: TextStyle(fontSize: 18)),
          Text('Antônio Vitor', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}