import 'package:pharma_track/Detail_commands/Detail_command_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListeCommandsWidget extends StatefulWidget {
  const ListeCommandsWidget({Key key}) : super(key: key);

  @override
  _ListeCommandsWidgetState createState() => _ListeCommandsWidgetState();
}

class _ListeCommandsWidgetState extends State<ListeCommandsWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

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
          'Vos livraisons',
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: 'PT Serif',
                color: Color.fromARGB(255, 13, 28, 34),
              ),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFDBE2E7),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 34, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Colors.white,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 0, 4, 0),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 0, 0),
                                        child: TextFormField(
                                          controller: textController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Rechercher',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF82878C),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF95A1AC),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x004B39EF),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x004B39EF),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF151B1E),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      buttonSize: 48,
                                      icon: Icon(
                                        Icons.filter_alt_rounded,
                                        color: Color(0xFF95A1AC),
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: Column(
                children: [
                  TabBar(
                    labelColor: //FlutterFlowTheme.of(context).primaryColor
                        Color.fromARGB(255, 14, 144, 167),
                    labelStyle: FlutterFlowTheme.of(context).bodyText1,
                    indicatorColor: FlutterFlowTheme.of(context).secondaryColor,
                    tabs: [
                      Tab(
                        text: 'Commandes',
                      ),
                      Tab(
                        text: 'En attente\nd\'expédition',
                      ),
                      Tab(
                        text: 'commandes\nannulées',
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ListView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          children: [
                            ListTile(
                              leading: FaIcon(
                                FontAwesomeIcons.boxOpen,
                                color: Color(0xFF6F7F7D),
                              ),
                              title: Text(
                                'nom de la commande:',
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'PT Serif',
                                      color: Color.fromARGB(255, 13, 28, 34),
                                    ),
                              ),
                              subtitle: Text(
                                'référence :\ntotal:\nlivraison à : nom de la pharmacie \nNuméro de la livraison ',
                                style: FlutterFlowTheme.of(context).subtitle2,
                              ),
                              trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    IconButton(
                                        icon: Icon(
                                          Icons.read_more,
                                          size: 32.0,
                                          color: Color(0xFF303030),
                                        ),
                                        onPressed: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailCommandWidget(),
                                            ),
                                          );
                                        }),
                                  ]),
                              tileColor: Color(0xFFF5F5F5),
                            )
                          ],
                        ),
                        ListView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          children: [
                            ListTile(
                              leading: FaIcon(
                                FontAwesomeIcons.boxOpen,
                                color: Color(0xFF24711E),
                              ),
                              title: Text(
                                'nom de la livraison:',
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'PT Serif',
                                      color: Color.fromARGB(255, 13, 28, 34),
                                    ),
                              ),
                              subtitle: Text(
                                'référence :\ntotal:\nlivraison à : nom de la pharmacie \nNuméro de la livraison ',
                                style: FlutterFlowTheme.of(context).subtitle2,
                              ),
                              trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    IconButton(
                                        icon: Icon(
                                          Icons.read_more,
                                          size: 32.0,
                                          color: Color(0xFF303030),
                                        ),
                                        onPressed: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailCommandWidget(),
                                            ),
                                          );
                                        }),
                                  ]),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                            ),
                          ],
                        ),
                        ListView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          children: [
                            ListTile(
                              leading: FaIcon(
                                FontAwesomeIcons.boxOpen,
                                color: Color(0xFFDF2A2A),
                              ),
                              title: Text(
                                'nom de la livraison :',
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'PT Serif',
                                      color: Color.fromARGB(255, 13, 28, 34),
                                    ),
                              ),
                              subtitle: Text(
                                'référence :\ntotal:\nlivraison à : nom de la pharmacie \nNuméro de la livraison ',
                                style: FlutterFlowTheme.of(context).subtitle2,
                              ),
                              trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    IconButton(
                                        icon: Icon(
                                          Icons.read_more,
                                          size: 32.0,
                                          color: Color(0xFF303030),
                                        ),
                                        onPressed: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailCommandWidget(),
                                            ),
                                          );
                                        }),
                                  ]),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
