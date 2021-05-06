import 'package:flutter/material.dart';

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