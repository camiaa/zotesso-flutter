import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cadastro_produto.dart';
import 'lista_produtos_model.dart';
export 'lista_produtos_model.dart';

class ListaProdutosWidget extends StatefulWidget {
  const ListaProdutosWidget({super.key});

  static String routeName = 'ListaProdutos';
  static String routePath = '/listaProdutos';

  @override
  State<ListaProdutosWidget> createState() => _ListaProdutosWidgetState();
}

class _ListaProdutosWidgetState extends State<ListaProdutosWidget> {
  late ListaProdutosModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = ListaProdutosModel();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  void _abrirCadastro() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CadastroProdutoWidget()),
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
          'CARDÁPIO DE PRODUTOS',
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
            icon: const Icon(Icons.add_circle_outline, color: Color(0xFFFAF2EB), size: 28),
            tooltip: 'Cadastrar Produto',
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
          'NOVO PRODUTO',
          style: GoogleFonts.inter(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),
      // ListView com Backend Query (List of Documents)
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('produtos')
              .orderBy('data_criacao', descending: true)
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
                        'Erro ao carregar produtos:\n${snapshot.error}',
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
                        Icons.bakery_dining_outlined,
                        size: 72,
                        color: const Color(0xFF836638).withOpacity(0.6),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Nenhum produto cadastrado ainda',
                        style: GoogleFonts.oswald(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF3C1E02),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Toque no botão abaixo (+) para cadastrar o primeiro produto do cardápio.',
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
                final preco = data['preco'];
                final precoFormatado = preco != null
                    ? 'R\$ ${double.tryParse(preco.toString())?.toStringAsFixed(2).replaceAll('.', ',') ?? preco.toString()}'
                    : 'R\$ --';
                final categoria = data['categoria']?.toString() ?? 'Geral';
                final descricao = data['descricao']?.toString() ?? '';

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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFAF2EB),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: const Color(0xFFD6BBA3)),
                              ),
                              child: const Icon(
                                Icons.bakery_dining_rounded,
                                color: Color(0xFF3C1E02),
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    nome,
                                    style: GoogleFonts.oswald(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF3C1E02),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF836638),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      categoria,
                                      style: GoogleFonts.inter(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              precoFormatado,
                              style: GoogleFonts.interTight(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF3C1E02),
                              ),
                            ),
                          ],
                        ),
                        if (descricao.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          const Divider(height: 1, color: Color(0xFFFAF2EB)),
                          const SizedBox(height: 8),
                          Text(
                            descricao,
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: const Color(0xFF61462D),
                            ),
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
