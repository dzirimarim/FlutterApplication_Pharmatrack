import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_track/Model/TourModel.dart';
import 'package:pharma_track/home_page/home_page_widget.dart';
import '../backend/api_requests/api_calls.dart';
import '../detail_tournee/detail_tournee_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';

class ListTourneeWidget extends StatefulWidget {
  const ListTourneeWidget({Key key}) : super(key: key);

  @override
  _ListTourneeWidgetState createState() => _ListTourneeWidgetState();
}

class _ListTourneeWidgetState extends State<ListTourneeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var dateJour = DateTime.now();
  int len = 0;
  int _selectedIndex = 0;
  List<TourModel> _postList = new List<TourModel>();
  List values = [];
  List dataNL = [];
  int j = 0;

  Future<List<dynamic>> fetchPost() async {
    final response =
        await http.get(Uri.parse('http://192.168.43.71:8080/api/tour/all/'));

    setState(() => values = json.decode(response.body));
    if (values.length > 0) {
      for (int i = 0; i < values.length; i++) {
        if (values[i] != null) {
          Map<String, dynamic> map = values[i];
          _postList.add(TourModel.fromJson(map));
          debugPrint('Id-------${map['id']}');
          debugPrint(values.toString());
        }
      }
    }
    return _postList;
  }

  @override
  void initState() {
    super.initState();
    this.fetchPost();
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const _pages = <Widget>[
    ListTourneeWidget(), //this is a stateful widget on a separate file
    //DetailTourneeWidget(), //this is a stateful widget on a separate file
    HomePageWidget(), //this is a stateful widget on a separate file
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = Container(); // default
    switch (_selectedIndex) {
      case 0:
        widget = ListTourneeWidget();
        break;
      case 1:
        //widget = DetailTourneeWidget();
        break;
      case 2:
        widget = HomePageWidget();
        break;
    }

    int i;
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
          'Mes tournées',
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
                Icons.logout,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePageWidget(),
                  ),
                );
              }),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFF323D70),
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Stack(children: [
                  Align(
                    alignment: AlignmentDirectional(0, -0.85),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\nDate de jour : ' + dateJour.toString() + '\n',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF15212B),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
              new Row(children: <Widget>[
                Expanded(
                  child: new ListView.builder(
                      shrinkWrap: true,
                      itemCount: values.length,
                      itemBuilder: (context, index) {
                        if ((values[index]['statut'] == "EN_COURS_LIVRAISON")) {
                          return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                        alignment:
                                            AlignmentDirectional(-0.85, -0.55),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailTourneeWidget(
                                                          textt: values[index]
                                                              ['id'],
                                                        )));
                                          },
                                          child: SingleChildScrollView(
                                              child: Wrap(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 16,
                                                      height: 16,
                                                      decoration: BoxDecoration(
                                                        color: Color.fromARGB(
                                                            255, 153, 153, 152),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 2,
                                                      height: 110,
                                                      decoration: BoxDecoration(
                                                        color: Color.fromARGB(
                                                            255, 153, 153, 152),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 12, 0, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.85,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Wrap(
                                                    spacing:
                                                        8.0, // gap between adjacent chips
                                                    runSpacing:
                                                        4.0, // gap between lines
                                                    direction: Axis.horizontal,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        10,
                                                                        0,
                                                                        0),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                              child: Stack(
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            15,
                                                                        bottom:
                                                                            0,
                                                                        right:
                                                                            0,
                                                                        top:
                                                                            0), //apply padding to some sides only
                                                                child: Text(
                                                                  'Référence:' +
                                                                      values[index]
                                                                              [
                                                                              'id']
                                                                          .toString(),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  softWrap:
                                                                      false,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lexend Deca',
                                                                        color: Color(
                                                                            0xFF060E32),
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                              //apply padding to some sides only
                                                              Positioned(
                                                                  right: 8,
                                                                  child: Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerRight,
                                                                    child: Icon(
                                                                      Icons
                                                                          .check,
                                                                      color: Color(
                                                                          0xFF060E32),
                                                                      size: 25,
                                                                    ),
                                                                  ))
                                                            ],
                                                          ))
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 15,
                                                                    bottom: 0,
                                                                    right: 0,
                                                                    top:
                                                                        0), //apply padding to some sides only
                                                            child: Text(
                                                                'heure prévisionelle ' +
                                                                    ":" +
                                                                    values[index]
                                                                            [
                                                                            'dateDebutPrev']
                                                                        .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend Deca',
                                                                      color: Color(
                                                                          0xFF8B97A2),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                softWrap: true,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                          ),
                                                          Flexible(
                                                            child:
                                                                new Container(
                                                              padding:
                                                                  new EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          13.0),
                                                              /* child: new Text(
                                                        '7h : 15 min',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                        overflow: TextOverflow
                                                            .ellipsis),*/
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 15,
                                                                    bottom: 0,
                                                                    right: 0,
                                                                    top:
                                                                        0), //apply padding to some sides only
                                                            child: Text(
                                                                'Nombre de kilométres :',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                        fontFamily:
                                                                            'PT Serif',
                                                                        color: Color(
                                                                            0xFF060E32)),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                                values[index][
                                                                        'nbreKilometres']
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend Deca',
                                                                      color: Color(
                                                                          0xFF060E32),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 15,
                                                                    bottom: 0,
                                                                    right: 0,
                                                                    top:
                                                                        0), //apply padding to some sides only
                                                            child: Text(
                                                                'Nombre de packages  :',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                        fontFamily:
                                                                            'PT Serif',
                                                                        color: Color(
                                                                            0xFF323D70)),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              values[index][
                                                                      'nombreLivraisons']
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: Color(
                                                                        0xFF060E32),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 15,
                                                                    bottom: 0,
                                                                    right: 0,
                                                                    top:
                                                                        0), //apply padding to some sides only
                                                            child: Text(
                                                                'Durée de livraison :',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                        fontFamily:
                                                                            'PT Serif',
                                                                        color: Color(
                                                                            0xFF323D70)),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              values[index][
                                                                      'dateTournee']
                                                                  .toString(),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: Color(
                                                                        0xFF060E32),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        10,
                                                                        0,
                                                                        0),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                        )),
                                  ]));
                        } else {
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                    alignment:
                                        AlignmentDirectional(-0.85, -0.55),
                                    child: InkWell(
                                      onTap: () => showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Expanded(
                                              child: Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.0)),
                                                  child: Stack(
                                                    overflow: Overflow.visible,
                                                    alignment:
                                                        Alignment.topCenter,
                                                    children: [
                                                      Container(
                                                        height: 120,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  5, 30, 10, 1),
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                'Tournée déjà terminée !!',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'PT Serif',
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          180,
                                                                          213,
                                                                          226),
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                              ),
                                                              SizedBox(
                                                                height: 7,
                                                              ),
                                                              RaisedButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                color: Color(
                                                                    0xFFE7600A),
                                                                child: Text(
                                                                  'Ok',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                          top: -35,
                                                          child: CircleAvatar(
                                                            backgroundColor:
                                                                Color(
                                                                    0xFFE7600A),
                                                            radius: 30,
                                                            child: Icon(
                                                              Icons
                                                                  .error_outline,
                                                              color:
                                                                  Colors.white,
                                                              size: 30,
                                                            ),
                                                          )),
                                                    ],
                                                  )));
                                        },
                                      ),
                                      child: SingleChildScrollView(
                                        child: Wrap(children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 16,
                                                  height: 16,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFE7600A),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Container(
                                                  width: 2,
                                                  height: 110,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFE7600A),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 12, 0, 0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.85,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Wrap(
                                                spacing:
                                                    8.0, // gap between adjacent chips
                                                runSpacing:
                                                    4.0, // gap between lines
                                                direction: Axis.horizontal,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10,
                                                                    10, 0, 0),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                          child: Stack(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 15,
                                                                    bottom: 0,
                                                                    right: 0,
                                                                    top:
                                                                        0), //apply padding to some sides only
                                                            child: Text(
                                                              'Référence:' +
                                                                  values[index]
                                                                          ['id']
                                                                      .toString(),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              softWrap: false,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: Color(
                                                                        0xFF060E32),
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          //apply padding to some sides only
                                                          Positioned(
                                                              right: 8,
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                child: Icon(
                                                                  Icons.check,
                                                                  color: Color(
                                                                      0xFFE7600A),
                                                                  size: 25,
                                                                ),
                                                              )),
                                                        ],
                                                      ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: 15,
                                                            bottom: 0,
                                                            right: 0,
                                                            top:
                                                                0), //apply padding to some sides only
                                                        child: Text(
                                                            'heure prévisionelle ' +
                                                                ":" +
                                                                values[index][
                                                                        'dateDebutPrev']
                                                                    .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Color(
                                                                      0xFF8B97A2),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                            softWrap: true,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ),
                                                      Flexible(
                                                        child: new Container(
                                                          padding:
                                                              new EdgeInsets
                                                                      .only(
                                                                  right: 13.0),
                                                          /* child: new Text(
                                                        '7h : 15 min',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                        overflow: TextOverflow
                                                            .ellipsis),*/
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: 15,
                                                            bottom: 0,
                                                            right: 0,
                                                            top:
                                                                0), //apply padding to some sides only
                                                        child: Text(
                                                            'Nombre de kilométres :',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                    fontFamily:
                                                                        'PT Serif',
                                                                    color: Color(
                                                                        0xFF060E32)),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 0),
                                                        child: Text(
                                                            values[index][
                                                                    'nbreKilometres']
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Color(
                                                                      0xFF060E32),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: 15,
                                                            bottom: 0,
                                                            right: 0,
                                                            top:
                                                                0), //apply padding to some sides only
                                                        child: Text(
                                                            'Nombre de packages  :',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                    fontFamily:
                                                                        'PT Serif',
                                                                    color: Color(
                                                                        0xFF323D70)),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 0),
                                                        child: Text(
                                                          values[index][
                                                                  'nombreLivraisons']
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: Color(
                                                                    0xFF060E32),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: 15,
                                                            bottom: 0,
                                                            right: 0,
                                                            top:
                                                                0), //apply padding to some sides only
                                                        child: Text(
                                                            'Durée de livraison :',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                    fontFamily:
                                                                        'PT Serif',
                                                                    color: Color(
                                                                        0xFF323D70)),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 0),
                                                        child: Text(
                                                          values[index][
                                                                  'dateTournee']
                                                              .toString(),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: Color(
                                                                    0xFF060E32),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10,
                                                                    10, 0, 0),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ))
                              ],
                            ),
                          );
                        }
                      }),
                )
              ]),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.route),
            label: 'tournées',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'aide',
            //activeIcon: DetailTourneeWidget(textt: -1)r
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Réglages',
            // activeIcon: HomePageWidget()
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFE7600A),
        unselectedItemColor: Color(0xFF323D70),
        onTap: _onItemTapped,
      ),
    );
  }
}
