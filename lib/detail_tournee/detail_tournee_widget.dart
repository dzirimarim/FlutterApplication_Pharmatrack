import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharma_track/list_tournee/list_tournee_widget.dart';
import '../Model/PharmacieModel.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../scan_charge/scan_charge_widget.dart';
import 'package:flutter/material.dart';

class DetailTourneeWidget extends StatefulWidget {
  final textt;
  const DetailTourneeWidget({Key key, this.textt}) : super(key: key);

  @override
  _DetailTourneeWidgetState createState() => _DetailTourneeWidgetState();
}

class _DetailTourneeWidgetState extends State<DetailTourneeWidget> {
  DateTimeRange calendarSelectedDay;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<PharmacieModel> _pharmacieList = new List<PharmacieModel>();
  List values = [];

  Future<List<dynamic>> fetchPharmacie() async {
    final response = await http.get(Uri.parse(
        'http://192.168.43.71:8080/api/tour/pharms?id=' +
            widget.textt.toString()));

    setState(() => values = json.decode(response.body));
    if (values.length > 0) {
      for (int i = 0; i < values.length; i++) {
        if (values[i] != null) {
          Map<String, dynamic> map = values[i];
          // _pharmacieList.add(PharmacieModel.fromJson(map));
          debugPrint('Id-------${map['id']}');
          debugPrint(values.toString());
        }
      }
    }
    return _pharmacieList;
  }

  @override
  void initState() {
    super.initState();
    this.fetchPharmacie();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
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
              'assets/images/logo.jpg',
              width: 74,
              height: 74,
              fit: BoxFit.fill,
            ),
          ],
        ),
        title: Text(
          'Détails de la tournée',
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: 'PT Serif',
                color: Color(0xFF323D70),
              ),
        ),
        actions: [
          FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () async {
                await Navigator.pop(context);
              }),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFF323D70),
      body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(children: [
            SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.max, children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 12),
                      child: Text(
                        'Cette semaine',
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF8B97A2),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.85, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
                        child: Text(
                          'Tournée numéro ' + widget.textt.toString(),
                          textAlign: TextAlign.end,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'PT Serif',
                                    color: Color.fromARGB(255, 13, 28, 34),
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                for (int i = 0; i < values.length; i++)
                  Row(mainAxisSize: MainAxisSize.max, children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Positioned(
                                          left: 8,
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Image.asset(
                                                'assets/images/Bâton-dAsclépios-logo.jpg',
                                                width: 40,
                                                height: 40,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-0.9, 0.35),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                    child: Text(
                                                  ' ' +
                                                      values[i]['nomPharmacie'],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFFE7600A),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                                height: 1,
                                decoration: BoxDecoration(
                                  color: Color(0xFFDBE2E7),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Nombre de packages à livrer : ' +
                                            values[i]['numeroTel'].toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
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
                              Align(
                                alignment: AlignmentDirectional(-0.9, 0),
                                child: Text(
                                  'Heure prévue : ' + values[i]['adresseEmail'],
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color.fromARGB(255, 53, 95, 134),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.9, 0),
                                child: Text(
                                  'Heure réelle : ' +
                                      values[i]['adresseEmail'] +
                                      '\n',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color.fromARGB(255, 53, 95, 134),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                /*  if (widget.textt != -1)
                    Row(mainAxisSize: MainAxisSize.max, children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
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
                                            alignment: AlignmentDirectional(
                                                -0.9, 0.35),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                    ' ' + data2[j]['name'],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFF81D4FA),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ))
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ]),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  height: 1,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFDBE2E7),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 4, 12, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Nombre de packages à livrer : ' +
                                              data2[j]['Ncolis'].toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
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
                                Align(
                                  alignment: AlignmentDirectional(-0.9, 0),
                                  child: Text(
                                    'Heure prévue : ' + data2[j]['heureP'],
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color:
                                              Color.fromARGB(255, 53, 95, 134),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.9, 0),
                                  child: Text(
                                    'Heure réelle : ' +
                                        data2[j]['heureP'] +
                                        '\n',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color:
                                              Color.fromARGB(255, 53, 95, 134),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ])*/
              ]),
            )
          ])),
      persistentFooterButtons: [
        Container(
            width: 900,
            height: 50,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ScanChargeWidget(idt: widget.textt),
                        ),
                      );
                    },
                    text: 'Charger',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: Color(0xFFE7600A),
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
