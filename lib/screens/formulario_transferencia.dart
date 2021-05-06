
import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class FormularioDeTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Criando Transferencia'),
      ),
      body: ListView(children: [
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