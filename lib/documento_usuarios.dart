import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InserirDocumentoPage extends StatefulWidget {
  const InserirDocumentoPage({Key? key}) : super(key: key);

  @override
  _InserirDocumentoPageState createState() => _InserirDocumentoPageState();
}

class _InserirDocumentoPageState extends State<InserirDocumentoPage> {
  var txtNome = TextEditingController();
  var txtCpf = TextEditingController();

  //
  // RETORNAR UM DOCUMENTO a partir do ID
  //
  getDocumentById(id) async{
    
    // select * from tb_Usuarios where id = 1;
    await FirebaseFirestore.instance.collection('Usuarios')
      .doc(id).get().then((doc){
        txtNome.text = doc.get('nome');
        txtCpf.text = doc.get('cpf');
      });

  }

  @override
  Widget build(BuildContext context) {

    //
    // RECUPERAR o ID do Café
    //
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null){
      if (txtNome.text.isEmpty && txtCpf.text.isEmpty){
        getDocumentById(id);
      }
    }


    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.brown,
      ),
      backgroundColor: Colors.brown[50],
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            TextField(
              controller: txtNome,
              style: const TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
              decoration: const InputDecoration(
                labelText: 'Nome',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: txtCpf,
              style: const TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
              decoration: const InputDecoration(
                labelText: 'Preço',
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
                    child: const Text('Salvar',style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                    onPressed: () {

                      if (id == null){
                        //
                        // ADICIONAR DOCUMENTO NO FIRESTORE
                        //
                        FirebaseFirestore.instance
                            .collection('Usuarios')
                            .add({'nome': txtNome.text, 'preco': txtCpf.text});
                      }else{
                        //
                        // ATUALIZAR DOCUMENTO NO FIRESTORE
                        //
                        FirebaseFirestore.instance
                            .collection('Usuarios')
                            .doc(id.toString()).set({'nome': txtNome.text, 'preco': txtCpf.text});
                      }


                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Operação realizada com sucesso!'),
                        duration: Duration(seconds: 2),
                      ));

                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                   width: 150,
                  color: Colors.blueGrey[400],
                  child: OutlinedButton(
                    child: const Text('cancelar',style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}