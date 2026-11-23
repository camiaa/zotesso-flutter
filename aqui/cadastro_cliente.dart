import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cadastro_cliente_model.dart';
export 'cadastro_cliente_model.dart';

class CadastroClienteWidget extends StatefulWidget {
  const CadastroClienteWidget({super.key});

  static String routeName = 'CadastroCliente';
  static String routePath = '/cadastroCliente';

  @override
  State<CadastroClienteWidget> createState() => _CadastroClienteWidgetState();
}

class _CadastroClienteWidgetState extends State<CadastroClienteWidget> {
  late CadastroClienteModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _model = CadastroClienteModel();
    _model.nomeController ??= TextEditingController();
    _model.telefoneController ??= TextEditingController();
    _model.emailController ??= TextEditingController();
    _model.enderecoController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> _salvarCliente() async {
    final nome = _model.nomeController?.text.trim() ?? '';
    final telefone = _model.telefoneController?.text.trim() ?? '';
    final email = _model.emailController?.text.trim() ?? '';
    final endereco = _model.enderecoController?.text.trim() ?? '';

    // Validação de campos vazios (sugestão recomendada no PDF)
    if (nome.isEmpty || telefone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xFFB00020),
          content: Text(
            'Por favor, preencha os campos obrigatórios: Nome e Telefone!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    setState(() => _isSaving = true);

    try {
      // Create Document no Cloud Firestore (Coleção: clientes)
      await FirebaseFirestore.instance.collection('clientes').add({
        'nome': nome,
        'telefone': telefone,
        'email': email.isNotEmpty ? email : 'Não informado',
        'endereco': endereco.isNotEmpty ? endereco : 'Não informado',
        'data_cadastro': FieldValue.serverTimestamp(),
      });

      // Limpar os campos do formulário (requisito do PDF)
      _model.nomeController?.clear();
      _model.telefoneController?.clear();
      _model.emailController?.clear();
      _model.enderecoController?.clear();

      if (!mounted) return;

      // Mensagem de sucesso Show Snack Bar (requisito do PDF)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xFF3C1E02),
          content: Text(
            'Cliente cadastrado com sucesso!',
            style: TextStyle(color: Color(0xFFFAF2EB), fontWeight: FontWeight.bold),
          ),
          duration: Duration(seconds: 3),
        ),
      );

      // Retorna para a lista de clientes
      await Future.delayed(const Duration(milliseconds: 600));
      if (mounted && Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.shade800,
          content: Text('Erro ao salvar cliente no Firestore: $e'),
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
          'CADASTRO DE CLIENTE',
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
                  'Cadastre clientes para controle de encomendas e fidelidade',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xFF61462D),
                  ),
                ),
                const SizedBox(height: 24),

                // Campo: Nome
                _buildLabel('Nome Completo *'),
                TextFormField(
                  controller: _model.nomeController,
                  decoration: _inputDecoration(
                    hintText: 'Ex: Maria Silva',
                    icon: Icons.person_rounded,
                  ),
                  style: GoogleFonts.inter(color: const Color(0xFF3C1E02)),
                ),
                const SizedBox(height: 16),

                // Campo: Telefone / WhatsApp
                _buildLabel('Telefone / WhatsApp *'),
                TextFormField(
                  controller: _model.telefoneController,
                  keyboardType: TextInputType.phone,
                  decoration: _inputDecoration(
                    hintText: 'Ex: (41) 99999-8888',
                    icon: Icons.phone_rounded,
                  ),
                  style: GoogleFonts.inter(color: const Color(0xFF3C1E02)),
                ),
                const SizedBox(height: 16),

                // Campo: E-mail
                _buildLabel('E-mail'),
                TextFormField(
                  controller: _model.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration(
                    hintText: 'Ex: maria@email.com',
                    icon: Icons.email_rounded,
                  ),
                  style: GoogleFonts.inter(color: const Color(0xFF3C1E02)),
                ),
                const SizedBox(height: 16),

                // Campo: Endereço
                _buildLabel('Endereço / Bairro'),
                TextFormField(
                  controller: _model.enderecoController,
                  decoration: _inputDecoration(
                    hintText: 'Ex: Rua das Flores, 123 - Centro',
                    icon: Icons.location_on_rounded,
                  ),
                  style: GoogleFonts.inter(color: const Color(0xFF3C1E02)),
                ),
                const SizedBox(height: 32),

                // Botão Salvar
                ElevatedButton(
                  onPressed: _isSaving ? null : _salvarCliente,
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
                          'SALVAR CLIENTE',
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
