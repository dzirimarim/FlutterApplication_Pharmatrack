import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pharma_track/Detail_client/Detail_clients_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../pack_scan_colis/pack_scan_colis_widget.dart';
import 'package:flutter/material.dart';

class ClientDetailWidget extends StatefulWidget {
  final List lisIds;

  const ClientDetailWidget({Key key, this.lisIds}) : super(key: key);
  @override
  _ClientDetailWidgetState createState() => _ClientDetailWidgetState();
}

class _ClientDetailWidgetState extends State<ClientDetailWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  DateTimeRange calendarSelectedDay;
  List<Widget> list = new List<Widget>();
  int i = 0;
  List data;
  int length = 0;
  List ids = [];
  List data2 = [];
  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/test2.json');
    setState(() => data = json.decode(jsonText));
    length = data.length;
    if (widget.lisIds.isNotEmpty) {
      for (var j = 0; j < data.length; j++) {
        for (var t = 0; t < widget.lisIds.length; t++) {
          if (data[j]['id'] == widget.lisIds[t]) {
            data2.add(data[j]);
          }
        }
      }
      data = data2;
      ids = widget.lisIds;
    }
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    this.loadJsonData();
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
          'itinéraire :' + data[i]['name'],

          ///ids.toString(),
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'PT Serif',
                color: Color.fromARGB(255, 13, 28, 34),
              ),
        ),
        actions: [
          FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailClientsWidget(),
                  ),
                );
              }),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0x3416202A),
                        offset: Offset(0, 3),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 12, 8, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 4),
                          child: Row(mainAxisSize: MainAxisSize.max, children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Colors.white,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 4, 12, 4),
                                          child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  child: Image.asset(
                                                    'assets/images/Bâton-dAsclépios-logo.jpg',
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -0.9, 0.35),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 4, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                              child: Text(
                                                            ' ' +
                                                                data[i]['name'],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Color(
                                                                      0xFF81D4FA),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ]),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.85,
                                          height: 1,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFDBE2E7),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 4, 12, 4),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Nombre de packages à livrer : ' +
                                                      data[i]['Ncolis']
                                                          .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF8B97A2),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 4, 12, 4),
                                          child: Text(
                                            'Date début prévue : ' +
                                                data[i]['dateDP'] +
                                                '\n' +
                                                'Date début réelle : ' +
                                                data[i]['dateDR'] +
                                                '\n' +
                                                'Date livraison prévue : ' +
                                                data[i]['dateLP'] +
                                                '\n' +
                                                'Datelivraison réelle : ' +
                                                data[i]['dateLR'] +
                                                '\n',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color.fromARGB(
                                                      255, 53, 95, 134),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            )
                          ]),
                        ),
                        Divider(
                          height: 8,
                          thickness: 1,
                          indent: 4,
                          endIndent: 4,
                          color: Color(0xFFDBE2E7),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    35, 35, 0, 0),
                                child: Image.asset(
                                  'assets/images/Google-Maps-All-Counties-in-Florida.jpg',
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height: 300,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Tournée  123456789                               14-03-2022',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'PT Serif',
                                      color: Color.fromARGB(255, 13, 28, 34),
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Container(
            alignment: Alignment.center,
            child: Column(
              /*mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,*/
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PackScanColisWidget(
                            listIds: ids,
                          ),
                        ),
                      );
                    },
                    text: 'Livrer',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: Color(0xFF81D4FA),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 12,
                    ),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
