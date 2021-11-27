import 'package:flutter/material.dart';
import 'package:gerenciador_criptomoeda/configuracao_sobreautor.dart';
import 'package:gerenciador_criptomoeda/pagina_moeda.dart';
import 'package:gerenciador_criptomoeda/pagina_vender_moeda.dart';

class Controller extends StatefulWidget {
  const Controller({Key? key}) : super(key: key);

  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  var telaAtual = 0;

  var pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          PaginaMoeda(),
          PaginaVender(),
          ConfiguracaoSobre(),
        ],
        onPageChanged: (index) {
          setState(() {
            telaAtual = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey,
        iconSize: 48,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.40),
        selectedFontSize: 16,
        unselectedFontSize: 16,
        currentIndex: telaAtual,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Lista"),
          
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_rounded),
              label: 'Vender'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Sobre'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Sobre'),
          
        ],
        onTap: (index) {
          setState(() {
            telaAtual = index;
          });

          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 400),
            curve: Curves.easeIn,
          );
        },
      ),
    );
  }
}
