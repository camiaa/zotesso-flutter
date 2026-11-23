import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'paginainicial_model.dart';
export 'paginainicial_model.dart';

class PaginainicialWidget extends StatefulWidget {
  const PaginainicialWidget({super.key});

  static String routeName = 'paginainicial';
  static String routePath = '/paginainicial';

  @override
  State<PaginainicialWidget> createState() => _PaginainicialWidgetState();
}

class _PaginainicialWidgetState extends State<PaginainicialWidget> {
  late PaginainicialModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginainicialModel());
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/Captura_de_tela_2026-05-04_235645.png',
                  width: 90044.39,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              Divider(
                thickness: 2,
                color: Color(0xFFD6BBA3),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(RegistroWidget.routeName);
                  },
                  text: 'CADASTRAR',
                  options: FFButtonOptions(
                    width: 300,
                    height: 40,
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: Color(0xFF3C1E02),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Color(0xFFFAF2EB),
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
              FFButtonWidget(
                onPressed: () async {
                  context.pushNamed(LoginWidget.routeName);
                },
                text: 'LOG IN',
                options: FFButtonOptions(
                  width: 300,
                  height: 40,
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  color: Color(0xFF3C1E02),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  elevation: 0,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              Divider(
                thickness: 2,
                color: Color(0xFFD6BBA3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
