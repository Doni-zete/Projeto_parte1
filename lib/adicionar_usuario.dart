import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdicionarUsuario extends StatefulWidget {
  const AdicionarUsuario({Key? key}) : super(key: key);

  @override
  _AdicionarUsuarioState createState() => _AdicionarUsuarioState();
}

class _AdicionarUsuarioState extends State<AdicionarUsuario> {
  //Referenciar a Coleção de Usuarios
  late CollectionReference usuarios;

  @override
  void initState() {
    super.initState();

    usuarios = FirebaseFirestore.instance.collection('Usuarios');
  }

  //
  // Item Lista
  // Definir a aparência de cada item da lista
  Widget itemLista(item) {
    String nome = item.data()['n00ome'];

    return ListTile(
      title: Text(nome, style: const TextStyle(fontSize: 30)),
      onTap: () {
        Navigator.pushNamed(context, '/inserir', arguments: item.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Criptomoeda'),
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/criar_conta');
            },
          )
        ],
      ),

      //
      // EXIBIR OS DOCUMENTOS DA COLEÇÃO DE Usuarios
      //
      body: StreamBuilder<QuerySnapshot>(

          //fonte de dados (coleção)
          stream: usuarios.snapshots(),

          //exibir os dados retornados
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                    child: Text('Não foi possível conectar ao Firebase'));

              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());

              //dados recebidos
              default:
                final dados = snapshot.requireData;
                return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (context, index) {
                      return itemLista(dados.docs[index]);
                    });
            }
          }),

      backgroundColor: Colors.blueGrey[400],
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/inserir');
        },
      ),
    );
  }
}
