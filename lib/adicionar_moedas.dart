import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class AdiconarMoeda extends StatefulWidget {
  const AdiconarMoeda({Key? key}) : super(key: key);

  @override
  _AdiconarMoedaState createState() => _AdiconarMoedaState();
}

class _AdiconarMoedaState extends State<AdiconarMoeda> {
  //Referenciar a Coleção de Cafés
  late CollectionReference criptomoedas;

  @override

  
  void initState() {
    super.initState();

    criptomoedas = FirebaseFirestore.instance.collection('Criptomoedas');
  }

  //
  // Item Lista
  // Definir a aparência de cada item da lista
  Widget itemLista(item) {
    String nome = item.data()['nome'];
    String preco = item.data()['preco'];

    return ListTile(

      
      title: Text(nome, style: const TextStyle(fontSize: 30)),
      subtitle: Text('R\$ $preco', style: const TextStyle(fontSize: 25)),
      trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            //
            // apagar um documento da criação
            //
            criptomoedas.doc(item.id).delete();
          }),
      onTap: () {
        Navigator.pushNamed(context, '/inserir', arguments: item.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adiconar Criptomoeda'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[400],
        automaticallyImplyLeading: false,
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.logout),
          //   onPressed: () async {
          //     FirebaseAuth.instance.signOut();
          //     Navigator.pushReplacementNamed(context, '/login');
          //   },
          // )
        ],
      ),

      //
      // EXIBIR OS DOCUMENTOS DA COLEÇÃO DE Criptomoedas
      //
      body: StreamBuilder<QuerySnapshot>(

          //fonte de dados (coleção)
          stream: criptomoedas.snapshots(),

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

      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        backgroundColor: Colors.blueGrey[400],
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/inserir');
        },
      ),
    );
  }
}
