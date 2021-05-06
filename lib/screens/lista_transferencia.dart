  import 'package:bytebank/main.dart';
  import 'package:flutter/material.dart';

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
      appBar: Header('transferência'),
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
      appBar: Header('transferência'),
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