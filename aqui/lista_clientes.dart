import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cadastro_cliente.dart';
import 'lista_clientes_model.dart';
export 'lista_clientes_model.dart';

class ListaClientesWidget extends StatefulWidget {
  const ListaClientesWidget({super.key});

  static String routeName = 'ListaClientes';
  static String routePath = '/listaClientes';

  @override
  State<ListaClientesWidget> createState() => _ListaClientesWidgetState();
}

class _ListaClientesWidgetState extends State<ListaClientesWidget> {
  late ListaClientesModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = ListaClientesModel();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  void _abrirCadastro() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CadastroClienteWidget()),
    );
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
          'LISTA DE CLIENTES',
          style: GoogleFonts.oswald(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add_alt_1, color: Color(0xFFFAF2EB), size: 26),
            tooltip: 'Cadastrar Cliente',
            onPressed: _abrirCadastro,
          ),
        ],
      ),
      // Botão + leva à tela de cadastro (requisito do PDF)
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _abrirCadastro,
        backgroundColor: const Color(0xFF3C1E02),
        foregroundColor: const Color(0xFFFAF2EB),
        icon: const Icon(Icons.add, size: 22),
        label: Text(
          'NOVO CLIENTE',
          style: GoogleFonts.inter(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),
      // ListView com Backend Query (List of Documents)
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('clientes')
              .orderBy('data_cadastro', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline, size: 48, color: Colors.red),
                      const SizedBox(height: 12),
                      Text(
                        'Erro ao carregar clientes:\n${snapshot.error}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(color: Colors.red.shade900),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF3C1E02),
                ),
              );
            }

            final docs = snapshot.data?.docs ?? [];

            if (docs.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people_outline,
                        size: 72,
                        color: const Color(0xFF836638).withOpacity(0.6),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Nenhum cliente cadastrado ainda',
                        style: GoogleFonts.oswald(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF3C1E02),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Toque no botão abaixo (+) para cadastrar o primeiro cliente.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: const Color(0xFF61462D),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            // Exibição em Cards com Data Binding (requisito do PDF)
            return ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 88),
              itemCount: docs.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final data = docs[index].data();
                final nome = data['nome']?.toString() ?? 'Sem nome';
                final telefone = data['telefone']?.toString() ?? 'Não informado';
                final email = data['email']?.toString() ?? '';
                final endereco = data['endereco']?.toString() ?? '';

                return Card(
                  elevation: 2,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(color: Color(0xFFD6BBA3), width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFAF2EB),
                                shape: BoxShape.circle,
                                border: Border.all(color: const Color(0xFFD6BBA3)),
                              ),
                              child: const Icon(
                                Icons.person,
                                color: Color(0xFF3C1E02),
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                nome,
                                style: GoogleFonts.oswald(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF3C1E02),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Divider(height: 1, color: Color(0xFFFAF2EB)),
                        const SizedBox(height: 10),

                        // Telefone com ícone
                        Row(
                          children: [
                            const Icon(Icons.phone, size: 16, color: Color(0xFF836638)),
                            const SizedBox(width: 8),
                            Text(
                              telefone,
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF3C1E02),
                              ),
                            ),
                          ],
                        ),

                        // E-mail com ícone
                        if (email.isNotEmpty && email != 'Não informado') ...[
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(Icons.email_outlined, size: 16, color: Color(0xFF836638)),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  email,
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    color: const Color(0xFF61462D),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],

                        // Endereço com ícone
                        if (endereco.isNotEmpty && endereco != 'Não informado') ...[
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined, size: 16, color: Color(0xFF836638)),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  endereco,
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    color: const Color(0xFF61462D),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
