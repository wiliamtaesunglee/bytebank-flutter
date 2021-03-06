import 'package:bytebank/screens/formulario_transferencia.dart';
import 'package:flutter/material.dart';

import 'components/header.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.accent,
        ),
      ),
      home: Scaffold(
      body: ListaTransferencias()
    ),);
  }
}

// ignore: must_be_immutable
// class Editor extends StatelessWidget {
//   final TextEditingController _controller;
//   final String _rotulo;
//   final String _dica;
//   IconData? icone;

//   Editor(this._controller, this._rotulo, this._dica, {this.icone});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
//       child: TextField(
//       style: TextStyle(
//         fontSize: 24.0,
//       ),
//       decoration: InputDecoration(
//         icon: this.icone != null ? Icon(icone) : null,
//         labelText: _rotulo,
//         hintText: _dica
//       ),
//       controller: _controller,
//       keyboardType: TextInputType.number,
//       ),
//     );
//   }
// }

/******************* LISTA DE TRANSFERENCIA ********************/ 

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia?> _transferencias = [];
  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push(context, MaterialPageRoute(builder: (ctx) {
            return FormularioDeTransferencia();
          }));
          future.then((transferenciaRecebida) {
            debugPrint('chegou no then do future');
            debugPrint('$transferenciaRecebida');
            _transferencias.add(transferenciaRecebida);
          });
        }
      ),
      appBar: Header('transfer??ncia'),
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = _transferencias[indice];
          return ItemTransferencia(transferencia!);
        }
      ), 
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}

class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on), 
        title: Text(_transferencia.valor.toString()), 
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class ListaTransferenciaState extends State<ListaTransferencias> {
  final List<Transferencia?> _transferencias = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push(context, MaterialPageRoute(builder: (ctx) {
            return FormularioDeTransferencia();
          }));
          future.then((transferenciaRecebida) {
            debugPrint('chegou no then do future');
            debugPrint('$transferenciaRecebida');
            if (transferenciaRecebida != null) {
              setState(() => {
                _transferencias.add(transferenciaRecebida)
              });
            }
          });
        }
      ),
      appBar: Header('transfer??ncia'),
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = _transferencias[indice];
          return ItemTransferencia(transferencia!);
        }
      ), 
    );
  }
}
