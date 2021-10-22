import 'package:flutter/material.dart';

class ConfiguracaoSobre extends StatefulWidget {
  ConfiguracaoSobre({Key? key}) : super(key: key);

  @override
  _ConfiguracaoSobreState createState() => _ConfiguracaoSobreState();
}

class _ConfiguracaoSobreState extends State<ConfiguracaoSobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          padding: EdgeInsets.only(
            top: 60,
            left: 40,
            right: 40,
          ),
          child: ListView(
            children: <Widget>[
              SizedBox(
                width: 128,
                height: 128,
                child: Image.asset('images/eu.jfif'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  "Desenvolvedor Donizete. Esse aplicativo e um gerenciador de criptomoedas a função dele e guardar o valor que você comprou em reais, em exchange e favoritar as moedas que voce acompanha",
                  style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 20,
              ),
            ],
          )),
    );
  }
}
