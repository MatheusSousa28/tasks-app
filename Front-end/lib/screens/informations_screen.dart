import 'package:flutter/material.dart';

class InformationsScreen extends StatelessWidget{
  const InformationsScreen({super.key});

  @override
  Widget build(BuildContext content){
    return Scaffold(
      appBar: AppBar(title: Text('Informações do app e grupo')),
      body: Column(
        children: [
          SizedBox(height: 80,),
          Text('Informações do grupo', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20,),
          Text('Paticipantes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text('Matheus Sousa, Andreza, Roger e Vitor', 
          style: TextStyle(fontSize: 16)),
          SizedBox(height: 40,),
          Text('Informações do app', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20,),
          Text('Este é um aplicativo de tarefas, que implementa as funcionalidades apresentadas em aula na disciplina de programação móvel até então. A aplicação foca em ser simples, seguindo os conceitos iniciais da disciplina.', 
          style: TextStyle(fontSize: 16)),
          
        ],
      ),
    );
  }
}