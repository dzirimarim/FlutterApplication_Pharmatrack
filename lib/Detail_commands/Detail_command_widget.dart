import 'package:pharma_track/Suivre_commande/Suivre_command.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class DetailCommandWidget extends StatefulWidget {
  const DetailCommandWidget({Key key}) : super(key: key);

  @override
  _DetailCommandWidgetState createState() => _DetailCommandWidgetState();
}

class _DetailCommandWidgetState extends State<DetailCommandWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: Stack(
          children: [
            Image.asset(
              'assets/images/logoPharma-track.png',
              width: 74,
              height: 74,
              fit: BoxFit.fill,
            ),
          ],
        ),
        title: Text(
          'Détails de la livraison ',
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: 'PT Serif',
                color: Color.fromARGB(255, 13, 28, 34),
              ),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                  child: Image.asset(
                    'assets/images/fnac_android.png',
                    width: MediaQuery.of(context).size.width,
                    height: 230,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Nom de la livraison : ',
                      style: FlutterFlowTheme.of(context).title2.override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Référence de la livraison : ',
                      style: FlutterFlowTheme.of(context).subtitle2.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF39D2C0),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'date de passage de livraison : \nDépot responsable livraison : \ndate de prélévement de la livraison : \nlivraison au pharmacie  : \n',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF8B97A2),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'état de la livraison  : ',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF39D2C0),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0, -0.75),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 14),
                            child: FFButtonWidget(
                              onPressed: () {
                                navSuivCommande();
                                print('ButtonPrimary pressed ...');
                              },
                              text: 'Suivre votre colis ',
                              options: FFButtonOptions(
                                width: 300,
                                height: 40,
                                color: Color(0xFF39D2C0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 0,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () {
                              print('ButtonPrimary pressed ...');
                            },
                            text: 'restaurer votre article ',
                            options: FFButtonOptions(
                              width: 300,
                              height: 40,
                              color: Colors.white,
                              textStyle:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color.fromARGB(255, 159, 40, 0),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 24),
              /*  child: FFButtonWidget(
                onPressed: () {
                  print('ButtonPrimary pressed ...');
                },
                  text: 'reçu de la commande ',
                options: FFButtonOptions(
                  width: 300,
                  height: 40,
                  color: Colors.white,
                  textStyle: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF005C9F),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 12,
                ),
              ),
           */
            ),
          ],
        ),
      ),
    );
  }

  navSuivCommande() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SuivreCommandWidget(),
        ));
  }
}
