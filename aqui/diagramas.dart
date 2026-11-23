import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'diagramas_model.dart';
export 'diagramas_model.dart';

class DiagramasWidget extends StatefulWidget {
  const DiagramasWidget({super.key});

  static String routeName = 'Diagramas';
  static String routePath = '/diagramas';

  @override
  State<DiagramasWidget> createState() => _DiagramasWidgetState();
}

class _DiagramasWidgetState extends State<DiagramasWidget> {
  late DiagramasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DiagramasModel());
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
            borderRadius: 8,
            buttonSize: 40,
            fillColor: Color(0xFF3C1E02),
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).info,
              size: 24,
            ),
            onPressed: () async {
              context.pushNamed(PaginainicialWidget.routeName);
            },
          ),
          title: Text(
            'DIAGRAMAS',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.oswald(
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: double.infinity,
                    height: 520,
                    decoration: BoxDecoration(
                      color: Color(0xFF1A1A1A),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 24,
                          color: Color(0x66000000),
                          offset: Offset(
                            0,
                            8,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 520,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/Captura_de_tela_2026-05-05_104355.png',
                              width: double.infinity,
                              height: 539.99,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: double.infinity,
                    height: 520,
                    decoration: BoxDecoration(
                      color: Color(0xFF1A1A1A),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 24,
                          color: Color(0x66000000),
                          offset: Offset(
                            0,
                            8,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 520,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/Captura_de_tela_2026-05-05_104404.png',
                              width: double.infinity,
                              height: 520,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]
                .divide(SizedBox(height: 16))
                .addToStart(SizedBox(height: 20))
                .addToEnd(SizedBox(height: 32)),
          ),
        ),
      ),
    );
  }
}
