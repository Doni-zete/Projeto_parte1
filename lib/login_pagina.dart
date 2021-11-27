import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Loginpagina extends StatefulWidget {
  Loginpagina({Key? key}) : super(key: key);

  @override
  _LoginpaginaState createState() => _LoginpaginaState();
}

class _LoginpaginaState extends State<Loginpagina> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var email = TextEditingController();
    return Scaffold(
      body: Container(
        color: Colors.white60,
        padding: EdgeInsets.only(
          top: 90,
          left: 40,
          right: 40,
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset('images/buy.PNG'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: txtEmail,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
                labelStyle: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: txtSenha,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                labelStyle: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              width: 100,
              height: 40,
              color: Colors.blueGrey[400],
              child: OutlinedButton(
                child: const Text(
                  'Entrar',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                onPressed: () {
                  setState(() {
                    isLoading = true;
                  });
                  login(txtEmail.text, txtSenha.text);
                },
              ),
            ),
            const SizedBox(height: 40),
            Container(
              width: 100,
              height: 40,
              color: Colors.blueGrey[400],
              child: OutlinedButton(
                child: const Text(
                  'Criar conta',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/criar_conta');
                },
              ),
            ),
            // const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
  
//login  firebase
   void login(email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((value) {
      Navigator.pushNamed(context, '/controller');
    }).catchError((erro) {
      var mensagem = '';
      if (erro.code == 'user-not-found') {
        mensagem = 'ERRO: Usuário não encontrado';
      } else if (erro.code == 'wrong-password') {
        mensagem = 'ERRO: Senha incorreta';
      } else if (erro.code == 'invalid-email') {
        mensagem = 'ERRO: Email inválido';
      } else {
        mensagem = erro.message;
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(mensagem), duration: const Duration(seconds: 2)));
    });
  }
}