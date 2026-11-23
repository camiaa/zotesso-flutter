import 'package:flutter/material.dart';

class CadastroProdutoModel {
  TextEditingController? nomeController;
  TextEditingController? precoController;
  TextEditingController? categoriaController;
  TextEditingController? descricaoController;

  void dispose() {
    nomeController?.dispose();
    precoController?.dispose();
    categoriaController?.dispose();
    descricaoController?.dispose();
  }
}
