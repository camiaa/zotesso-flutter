import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'equipe_model.dart';
export 'equipe_model.dart';

/// crie uma pagina que nela contenha dois campos para colocar foto um em cada
/// campo, de para colocar nome e uma descrição, basicamente para falar sobre
/// os desenvolvedores
class EquipeWidget extends StatefulWidget {
  const EquipeWidget({super.key});

  static String routeName = 'Equipe';
  static String routePath = '/equipe';

  @override
  State<EquipeWidget> createState() => _EquipeWidgetState();
}

class _EquipeWidgetState extends State<EquipeWidget> {
  late EquipeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EquipeModel());
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
        backgroundColor: Color(0xFFFAF2EB),
        appBar: AppBar(
          backgroundColor: Color(0xFF3C1E02),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 20,
            borderWidth: 1,
            buttonSize: 40,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFFFAF2EB),
              size: 24,
            ),
            onPressed: () async {
              context.pushNamed(PaginainicialWidget.routeName);
            },
          ),
          title: Text(
            'Equipe',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.oswald(
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Color(0xFFFAF2EB),
                  fontSize: 24,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                  child: Text(
                    '\nO trabalho apresentado da Padaria Hora Pães foi feito pelas seguintes integrantes, sendo divididas tarefas igualmente.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.plusJakartaSans(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: Color(0xFF3C1E02),
                          fontSize: 14,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFFAF2EB),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12,
                          color: Color(0x1A000000),
                          offset: Offset(
                            0,
                            4,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional(1, -1),
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Color(0xFF3C1E02),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0xFF3C1E02),
                                    width: 3,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.asset(
                                    'assets/images/WhatsApp_Image_2026-05-05_at_00.24.10.jpeg',
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  color: Color(0xFF3C1E02),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0xFFFAF2EB),
                                    width: 2,
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Icon(
                                    Icons.camera_alt_rounded,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Thaviny Rizzato de Souza',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.urbanist(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF3C1E02),
                                      fontSize: 24,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(height: 6)),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: Color(0xFFD6BBA3),
                          ),
                        ]
                            .divide(SizedBox(height: 16))
                            .addToStart(SizedBox(height: 28))
                            .addToEnd(SizedBox(height: 28)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFFAF2EB),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12,
                          color: Color(0x1A000000),
                          offset: Offset(
                            0,
                            4,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional(1, -1),
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Color(0xFFC8D7E4),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0xFF928163),
                                    width: 3,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.asset(
                                    'assets/images/WhatsApp_Image_2026-05-05_at_00.26.30.jpeg',
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  color: Color(0xFF928163),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0xFFFAF2EB),
                                    width: 2,
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Icon(
                                    Icons.camera_alt_rounded,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Camila Maria Scriptore Lopes',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.urbanist(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF3C1E02),
                                      fontSize: 24,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(height: 6)),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: Color(0xFFD6BBA3),
                          ),
                        ]
                            .divide(SizedBox(height: 16))
                            .addToStart(SizedBox(height: 28))
                            .addToEnd(SizedBox(height: 28)),
                      ),
                    ),
                  ),
                ),
              ]
                  .divide(SizedBox(height: 24))
                  .addToStart(SizedBox(height: 24))
                  .addToEnd(SizedBox(height: 40)),
            ),
          ),
        ),
      ),
    );
  }
}
