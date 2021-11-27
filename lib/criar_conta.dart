import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CriarContaPage extends StatefulWidget {
  const CriarContaPage({Key? key}) : super(key: key);

  @override
  _CriarContaPageState createState() => _CriarContaPageState();
}

class _CriarContaPageState extends State<CriarContaPage> {
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  var txtTelefone = TextEditingController();
  var txtCpf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Gerenciador de Criptomoedas'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[400]),
      backgroundColor: Colors.blueGrey[50],
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            TextField(
              controller: txtNome,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: txtCpf,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.perm_identity),
                labelText: 'Cpf',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: txtTelefone,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone_android),
                labelText: 'Telefone',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: txtEmail,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              controller: txtSenha,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w300,
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Senha',
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  color: Colors.blueGrey[400],
                  child: OutlinedButton(
                    child: const Text(
                      'Criar',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    onPressed: () {
                      criarConta(txtNome.text,txtCpf.text,txtTelefone.text,txtEmail.text, txtSenha.text );
                    },
                  ),
                ),
                Container(
                  width: 150,
                  color: Colors.blueGrey[400],
                  child: OutlinedButton(
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  //
  // criar conta firebase
  //
  void criarConta(nome, email, senha) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: senha,
    )
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuário criado com sucesso!'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context);
    }).catchError((erro) {
      if (erro.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('ERRO: O email informado já está em uso.'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('ERRO: ${erro.message}'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    });
  }
}
