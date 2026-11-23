import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'lista_produtos.dart';
import 'lista_clientes.dart';

import 'paginainicial2_model.dart';
export 'paginainicial2_model.dart';

class Paginainicial2Widget extends StatefulWidget {
  const Paginainicial2Widget({super.key});

  static String routeName = 'paginainicial2';
  static String routePath = '/paginainicial2';

  @override
  State<Paginainicial2Widget> createState() => _Paginainicial2WidgetState();
}

class _Paginainicial2WidgetState extends State<Paginainicial2Widget> {
  late Paginainicial2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Paginainicial2Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFFAF2EB),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/Captura_de_tela_2026-05-04_235645.png',
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: Color(0xFFD6BBA3),
                ),

                // Botão 1: INÍCIO (Tela original)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(
                        LoginWidget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.bottomToTop,
                          ),
                        },
                      );
                    },
                    text: 'INÍCIO',
                    options: FFButtonOptions(
                      width: 300,
                      height: 40,
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: const Color(0xFF3C1E02),
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                            color: const Color(0xFFFAF2EB),
                            letterSpacing: 2,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle:
                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                          ),
                      elevation: 0,
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),

                // Botão 2: EQUIPE (Tela original)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(EquipeWidget.routeName);
                    },
                    text: 'EQUIPE',
                    options: FFButtonOptions(
                      width: 300,
                      height: 40,
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: const Color(0xFF3C1E02),
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                            color: const Color(0xFFFAF2EB),
                            letterSpacing: 2,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle:
                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                          ),
                      elevation: 0,
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),

                // Botão 3: OBJETIVOS (Tela original)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(ObjetivosWidget.routeName);
                    },
                    text: 'OBJETIVOS',
                    options: FFButtonOptions(
                      width: 300,
                      height: 40,
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: const Color(0xFF3C1E02),
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                            color: const Color(0xFFFAF2EB),
                            letterSpacing: 2,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle:
                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                          ),
                      elevation: 0,
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),

                // Botão 4: DIAGRAMAS (Tela original)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(DiagramasWidget.routeName);
                    },
                    text: 'DIAGRAMAS',
                    options: FFButtonOptions(
                      width: 300,
                      height: 40,
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: const Color(0xFF3C1E02),
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                            color: const Color(0xFFFAF2EB),
                            letterSpacing: 2,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle:
                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                          ),
                      elevation: 0,
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),

                const Divider(
                  thickness: 2,
                  indent: 30,
                  endIndent: 30,
                  color: Color(0xFFD6BBA3),
                ),

                // Requisito 3º Trimestre - Entidade 1: PRODUTOS
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: FFButtonWidget(
                    onPressed: () async {
                      try {
                        context.pushNamed(ListaProdutosWidget.routeName);
                      } catch (_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ListaProdutosWidget(),
                          ),
                        );
                      }
                    },
                    text: 'PRODUTOS (CARDÁPIO)',
                    options: FFButtonOptions(
                      width: 300,
                      height: 44,
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: const Color(0xFF836638),
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                            fontStyle:
                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                          ),
                      elevation: 2,
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),

                // Requisito 3º Trimestre - Entidade 2: CLIENTES
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: FFButtonWidget(
                    onPressed: () async {
                      try {
                        context.pushNamed(ListaClientesWidget.routeName);
                      } catch (_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ListaClientesWidget(),
                          ),
                        );
                      }
                    },
                    text: 'CLIENTES CADASTRADOS',
                    options: FFButtonOptions(
                      width: 300,
                      height: 44,
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: const Color(0xFF836638),
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                            fontStyle:
                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                          ),
                      elevation: 2,
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const Divider(
                  thickness: 2,
                  color: Color(0xFFD6BBA3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
