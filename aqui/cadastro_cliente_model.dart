import 'package:flutter/material.dart';

class CadastroClienteModel {
  TextEditingController? nomeController;
  TextEditingController? telefoneController;
  TextEditingController? emailController;
  TextEditingController? enderecoController;

  void dispose() {
    nomeController?.dispose();
    telefoneController?.dispose();
    emailController?.dispose();
    enderecoController?.dispose();
  }
}
