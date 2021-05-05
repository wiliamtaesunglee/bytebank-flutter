import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      // appBar: AppBar(
      //   title: Text('Transferências'),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.add),
      ),
      body: FormularioDeTransferencia(),
    ),
  ),
);

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
          onPressed: () {
            debugPrint('clicou no confirmar');
            int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
            double? valor = double.tryParse(_controladorCampoValor.text);

            if(numeroConta != null && valor != null){
              final transferenciaCriada = Transferencia(valor, numeroConta);
              debugPrint('$transferenciaCriada');
            }
          },
        ),
      ],),
    );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController _controller;
  final String _rotulo;
  final String _dica;
  IconData? icone;

  Editor(this._controller, this._rotulo, this._dica, {this.icone})

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

class ListaTransferencias extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ItemTransferencia(Transferencia(1000.5, 1004)),
      ItemTransferencia(Transferencia(1000.4, 1003)),
      ItemTransferencia(Transferencia(1000.3, 1001)),
      ItemTransferencia(Transferencia(1000.2, 1002))
    ],);
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