import 'package:flutter/material.dart';

class Loginpagina extends StatefulWidget {
  Loginpagina({Key? key}) : super(key: key);

  @override
  _LoginpaginaState createState() => _LoginpaginaState();
}

class _LoginpaginaState extends State<Loginpagina> {
  TextEditingController txtnome = TextEditingController();

 
  @override
  Widget build(BuildContext context) {
    var nome = TextEditingController();
    return Scaffold(
      body: Container(
        
          color: Colors.white,
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
                controller: nome,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextField(
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
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/home');
                },
                child: Text('Entrar'),
              )
            ],
          )),
    );
  }
}
