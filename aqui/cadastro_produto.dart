import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cadastro_produto_model.dart';
export 'cadastro_produto_model.dart';

class CadastroProdutoWidget extends StatefulWidget {
  const CadastroProdutoWidget({super.key});

  static String routeName = 'CadastroProduto';
  static String routePath = '/cadastroProduto';

  @override
  State<CadastroProdutoWidget> createState() => _CadastroProdutoWidgetState();
}

class _CadastroProdutoWidgetState extends State<CadastroProdutoWidget> {
  late CadastroProdutoModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _model = CadastroProdutoModel();
    _model.nomeController ??= TextEditingController();
    _model.precoController ??= TextEditingController();
    _model.categoriaController ??= TextEditingController();
    _model.descricaoController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> _salvarProduto() async {
    final nome = _model.nomeController?.text.trim() ?? '';
    final precoTexto = _model.precoController?.text.trim() ?? '';
    final categoria = _model.categoriaController?.text.trim() ?? '';
    final descricao = _model.descricaoController?.text.trim() ?? '';

    // Validação de campos vazios (sugestão recomendada no PDF)
    if (nome.isEmpty || precoTexto.isEmpty || categoria.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xFFB00020),
          content: Text(
            'Por favor, preencha os campos obrigatórios: Nome, Preço e Categoria!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    final precoNum = double.tryParse(precoTexto.replaceAll(',', '.'));
    if (precoNum == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xFFB00020),
          content: Text('Informe um valor de preço válido (ex: 8.50).'),
        ),
      );
      return;
    }

    setState(() => _isSaving = true);

    try {
      // Create Document no Cloud Firestore (Coleção: produtos)
      await FirebaseFirestore.instance.collection('produtos').add({
        'nome': nome,
        'preco': precoNum,
        'categoria': categoria,
        'descricao': descricao,
        'data_criacao': FieldValue.serverTimestamp(),
      });

      // Limpar os campos do formulário (requisito do PDF)
      _model.nomeController?.clear();
      _model.precoController?.clear();
      _model.categoriaController?.clear();
      _model.descricaoController?.clear();

      if (!mounted) return;

      // Mensagem de sucesso Show Snack Bar (requisito do PDF)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xFF3C1E02),
          content: Text(
            'Produto cadastrado com sucesso!',
            style: TextStyle(color: Color(0xFFFAF2EB), fontWeight: FontWeight.bold),
          ),
          duration: Duration(seconds: 3),
        ),
      );

      // Aguarda breve momento e retorna para a lista
      await Future.delayed(const Duration(milliseconds: 600));
      if (mounted && Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.shade800,
          content: Text('Erro ao cadastrar no Firestore: $e'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFFAF2EB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3C1E02),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white, size: 24),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        title: Text(
          'CADASTRO DE PRODUTO',
          style: GoogleFonts.oswald(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Padaria Hora Pães',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.oswald(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF3C1E02),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Preencha as informações do novo item do cardápio',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xFF61462D),
                  ),
                ),
                const SizedBox(height: 24),

                // Campo: Nome do Produto
                _buildLabel('Nome do Produto *'),
                TextFormField(
                  controller: _model.nomeController,
                  decoration: _inputDecoration(
                    hintText: 'Ex: Pão de Queijo Tradicional',
                    icon: Icons.bakery_dining_rounded,
                  ),
                  style: GoogleFonts.inter(color: const Color(0xFF3C1E02)),
                ),
                const SizedBox(height: 16),

                // Campo: Preço
                _buildLabel('Preço (R\$) *'),
                TextFormField(
                  controller: _model.precoController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: _inputDecoration(
                    hintText: 'Ex: 6.50',
                    icon: Icons.attach_money_rounded,
                  ),
                  style: GoogleFonts.inter(color: const Color(0xFF3C1E02)),
                ),
                const SizedBox(height: 16),

                // Campo: Categoria
                _buildLabel('Categoria *'),
                TextFormField(
                  controller: _model.categoriaController,
                  decoration: _inputDecoration(
                    hintText: 'Ex: Pães, Bolos, Bebidas, Salgados, Cafés',
                    icon: Icons.category_rounded,
                  ),
                  style: GoogleFonts.inter(color: const Color(0xFF3C1E02)),
                ),
                const SizedBox(height: 16),

                // Campo: Descrição
                _buildLabel('Descrição do Produto'),
                TextFormField(
                  controller: _model.descricaoController,
                  maxLines: 3,
                  decoration: _inputDecoration(
                    hintText: 'Ex: Feito com ingredientes frescos e receita artesanal.',
                    icon: Icons.description_outlined,
                  ),
                  style: GoogleFonts.inter(color: const Color(0xFF3C1E02)),
                ),
                const SizedBox(height: 32),

                // Botão Salvar
                ElevatedButton(
                  onPressed: _isSaving ? null : _salvarProduto,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3C1E02),
                    foregroundColor: const Color(0xFFFAF2EB),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 3,
                  ),
                  child: _isSaving
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: Color(0xFFFAF2EB),
                          ),
                        )
                      : Text(
                          'SALVAR PRODUTO',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF3C1E02),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({required String hintText, required IconData icon}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: GoogleFonts.inter(color: Colors.grey.shade500, fontSize: 13),
      prefixIcon: Icon(icon, color: const Color(0xFF836638), size: 20),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFD6BBA3)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFD6BBA3), width: 1.2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF3C1E02), width: 2),
      ),
    );
  }
}
