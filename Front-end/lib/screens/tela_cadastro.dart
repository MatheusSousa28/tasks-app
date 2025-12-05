import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';



class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarController = TextEditingController();

  bool mostrarSenha = false;
  bool mostrarConfirmar = false;
  String? erro;


  //Função para salvar dados em arquivo local
   Future<void> salvarUsuario(String username, String senha) async {

    print("Salvando usuário...");
  // Cria o mapa com os dados
  final dados = {
    "username": username,
    "password": senha,
  };
  //Transforma em json
  final jsonString = jsonEncode(dados);

  // Pega o diretório local seguro do usuário
  final dir = await getApplicationDocumentsDirectory();
  print("Diretório: ${dir.path}"); 

  //Define o arquivo onde vamos salvar
  final arquivo = File("${dir.path}/usuario.json");

  // Escreve o conteúdo no arquivo
  await arquivo.writeAsString(jsonString);
   print("Usuário salvo!"); // DEBUG
}


 
  // funnção chamada ao clicar no botão "Criar Conta"
  void criarConta() async {
    print("Clicou no botão criar conta");

    String user = userController.text.trim();
    String s1 = senhaController.text;
    String s2 = confirmarController.text;

    setState(() {
      erro = null;
    });

    if (user.isEmpty) {
      setState(() => erro = "O usuário não pode ser vazio.");
      return;
    }

    if (s1.isEmpty || s2.isEmpty) {
      setState(() => erro = "Digite a senha e a confirmação.");
      return;
    }
   

    if (s1 != s2) {
      setState(() => erro = "As senhas não são iguais.");
      return;
    }

    await salvarUsuario(user, s1);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Usuário cadastrado com sucesso!")),
    );

    Navigator.pop(context); // volta para a tela login
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     
        title: const Text("Criar Conta"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo usuario
            const Text(""),
            TextField(
              controller: userController,
              decoration: const InputDecoration(
                hintText: "Digite o nome de usuário",
              ),
            ),

            const SizedBox(height:10),
            // Campo senha
            const Text(""),
            TextField(
              controller: senhaController,
              obscureText: !mostrarSenha,
              decoration: InputDecoration(
                hintText: "senha",
                suffixIcon: IconButton(
                  icon: Icon(
                    mostrarSenha ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() => mostrarSenha = !mostrarSenha);
                  },
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Campo confirmar senha
            const Text(""),
            TextField(
              controller: confirmarController,
              obscureText: !mostrarConfirmar,
              decoration: InputDecoration(
                hintText: "Confirme a senha",
                suffixIcon: IconButton(
                  icon: Icon(
                    mostrarConfirmar ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() => mostrarConfirmar = !mostrarConfirmar);
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Exibir erro se tiver
            if (erro != null)
              Text(
                erro!,
                style: const TextStyle(color: Colors.red),
              ),

            const SizedBox(height: 20),

            // Botão criar conta
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: criarConta,
                child: const Text("Criar Conta"),
              ),
            ),




            const SizedBox(height: 10),

            //botão voltar do login
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Já tenho conta"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}