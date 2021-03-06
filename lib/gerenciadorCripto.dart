import 'package:flutter/material.dart';
import 'package:gerenciador_criptomoeda/adicionar_moedas.dart';
import 'package:gerenciador_criptomoeda/adicionar_usuario.dart';
import 'package:gerenciador_criptomoeda/controller_tela.dart';
import 'package:gerenciador_criptomoeda/criar_conta.dart';
import 'package:gerenciador_criptomoeda/documetos.dart';
import 'package:gerenciador_criptomoeda/login_pagina.dart';

class GerenciadorCripto extends StatelessWidget {
  const GerenciadorCripto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Criptomoedas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => Loginpagina(),
        '/criar_conta': (context) => CriarContaPage(),
        '/controller': (context) => Controller(),
       '/inserir': (context) => InserirDocumentoPage(),
       '/inserirusuario': (context) => AdicionarUsuario(),

      },
    );
  }
}
