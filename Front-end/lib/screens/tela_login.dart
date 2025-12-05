    import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'tela_cadastro.dart';
import 'home_page.dart'; // <-- adicionei a import da HomePage

//função pra carregar usuario salvo
Future<Map<String, dynamic>?> carregarUsuario() async {
  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/usuario.json');

  if (!await file.exists()) {
    return null; // não existe ainda
  }

  String conteudo = await file.readAsString();
  return jsonDecode(conteudo);
}

//tela de login
class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  String erro = ""; // mensagem de erro

  // funcao de login
  Future<void> fazerLogin() async {
    Map<String, dynamic>? dados = await carregarUsuario();

    if (dados == null) {
      setState(() {
        erro = "Nenhum usuário cadastrado. Crie sua conta.";
      });

      //limpa a mensagem de erro da tela após 3 segundos
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          erro = "";
        });
      });

      return;
    }

    String userSalvo = dados["username"];
    String senhaSalva = dados["password"];

    String user = userController.text.trim();
    String senha = senhaController.text;

    if (user == userSalvo && senha == senhaSalva) {
      //login ok
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login realizado com sucesso!")),
      );

      // Navega para a HomePage
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      });

    } else {
      setState(() {
        erro = "Usuário ou senha incorretos!";
      });

      // Limpa a mensagem automaticamente após 3 segundos
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          erro = "";
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela de Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
             const SizedBox(height: 200),
            //campo usuário
            TextField(
              controller: userController,
              decoration: const InputDecoration(
                labelText: "Usuário",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            // campo senha
            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Senha",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            //mensagem de erro
            if (erro.isNotEmpty)
              Text(
                erro,
                style: const TextStyle(color: Colors.red),
              ),

            const SizedBox(height: 20),

            //Botão login
            ElevatedButton(
              onPressed: fazerLogin,
              child: const Text("Entrar"),
            ),
            const SizedBox(height: 10),

            //botão Criar Conta
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TelaCadastro()),
                );
              },
              child: const Text("Criar Conta"),
            ),
          ],
        ),
      ),
    );
  }
}
