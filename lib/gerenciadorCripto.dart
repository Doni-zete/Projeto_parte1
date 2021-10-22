import 'package:flutter/material.dart';
import 'package:gerenciador_criptomoeda/controller_tela.dart';
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
      routes: {
        '/': (context) => Loginpagina(),
        '/home': (context) => Controller(),
        
      },
    );
  }
}

