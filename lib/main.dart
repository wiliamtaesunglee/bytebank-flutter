import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      body: ListaTransferencias()
    ),);
  }
}

class Header extends AppBar {
  Header(String titulo) : super(title: Text(titulo));
}

/******************* FORMULARIO DE TRANSFERENCIA ********************/

class FormularioDeTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Criando Transferencia'),
      ),
      body: Column(children: [
        Editor(_controladorCampoNumeroConta, 'Numero da conta', '0000',),
        Editor(_controladorCampoValor, 'Número da conta', '0000', icone: Icons.monetization_on),
        RaisedButton(
          child: Text('Confirmar'),
          onPressed: () => _criaTransferencia(context),
        ),
      ],),
    );
  }


  void _criaTransferencia(BuildContext context) {
    debugPrint('clicou no confirmar');
    int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    double? valor = double.tryParse(_controladorCampoValor.text);

    if(numeroConta != null && valor != null){
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

// ignore: must_be_immutable
class Editor extends StatelessWidget {
  final TextEditingController _controller;
  final String _rotulo;
  final String _dica;
  IconData? icone;

  Editor(this._controller, this._rotulo, this._dica, {this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      child: TextField(
      style: TextStyle(
        fontSize: 24.0,
      ),
      decoration: InputDecoration(
        icon: this.icone != null ? Icon(icone) : null,
        labelText: _rotulo,
        hintText: _dica
      ),
      controller: _controller,
      keyboardType: TextInputType.number,
      ),
    );
  }
}

/******************* LISTA DE TRANSFERENCIA ********************/ 

class ListaTransferencias extends StatelessWidget {
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
          });
        }
      ),
      appBar: Header('transferência'),
      body: Column(children: [
      ItemTransferencia(Transferencia(1000.5, 1004)),
      ItemTransferencia(Transferencia(1000.4, 1003)),
      ItemTransferencia(Transferencia(1000.3, 1001))
    ],), 
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

// class ListaDeTransferenciaState extends State<ListaTransferencias> {
//   List<Transferencia> _transferencias = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Trasferencias'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           Future<Transferencia?> future = Navigator.push(context, MaterialPageRoute(builder: (ctx)) {
//             return FormularioDeTransferencia();
//           });

//           future.then((transferenciaParaAdicionar) {
//             debugPrint('Recebeu a transferencia para adicionar na lista: $transferenciaParaAdicionar');
          
//             if (transferenciaParaAdicionar != null) {
//               setState(() {
//                 _transferencias.add(transferenciaParaAdicionar)
//               });
//             }
//           });
//         },
//       ),
//       body: ListView.builder(itemBuilder: (ctx, index) {
//         Transferencia transferencia = _transferencias[index];
//         return ItemTransferencia(transferencia, Icons.monetization_on);
//       })
//     );
//   }
// }