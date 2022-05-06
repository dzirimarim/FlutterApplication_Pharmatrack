import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:pharma_track/Detail_client/Detail_clients_widget.dart';
import 'package:pharma_track/list_tournee/list_tournee_widget.dart';
import '../error_scan/error_scan_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class PackScanColisWidget extends StatefulWidget {
  final List listIds;
  final String nom;
  final idt;
  const PackScanColisWidget({Key key, this.listIds, this.nom, this.idt})
      : super(key: key);

  @override
  _PackScanColisWidgetState createState() => _PackScanColisWidgetState();
}

class _PackScanColisWidgetState extends State<PackScanColisWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> list = new List<Widget>();
  int i = 0;
  List data = [];
  int length = 0;
  int packTot = 0;
  List values = [];
  int id1;
  List ids = [];
  List Qrcodess = [];
  Future<void> getPharmacie() async {
    final response5 = await http.get(Uri.parse(
        'http://192.168.43.71:8080/api/tour/pharmaById?id=' +
            values[widget.listIds[0]].toString()));
    setState(() => value = json.decode('[' + response5.body + ']'));
    setState(() => data.addAll(value));
  }

  List StatTour = [];
  Future<void> Livrer(int i) async {
    final response = await http.put(
        Uri.parse('http://192.168.43.71:8080/api/tour/livrer/' + i.toString()));
    setState(() => StatTour = json.decode(response.body));
  }

  Future<String> loadJsonData() async {
    CodeQrList(0);
    ids = widget.listIds;
    if (ids.isNotEmpty) {
      id1 = ids[0];
      ids.removeAt(0);
    } else {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ListTourneeWidget(),
        ),
      );
      Livrer(widget.idt);
    }
    return 'success';
  }

  int nb = 0;
  List codesUsed = [];
  int TestQr(String Qr) {
    if (Qrcodess.contains(Qr)) {
      if (!codesUsed.contains(Qr)) {
        codesUsed.add(Qr);
        nb++;
      }
      return 1;
    }
    return 0;
  }

  List value = [];
  String _scanBarcode = "Aucun colis n'est scanné";
  Future<void> CodeQrList(int i) async {
    final response5 = await http.get(Uri.parse(
        'http://192.168.43.71:8080/api/tour/qrById?id=' +
            widget.listIds[i].toString()));
    setState(() => value = json.decode(response5.body));
    setState(() => Qrcodess.addAll(value));
  }

  int s = 0;
  int ret = 1;
  Future<void> scanQR() async {
    String barcodeScanRes = "-1";
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      if (barcodeScanRes != "-1") {
        if (TestQr(barcodeScanRes) == 1) {
          ret = 0;
        } else if (TestQr(barcodeScanRes) == 0) {
          ret = 1;
          NavError(barcodeScanRes);
        } else {
          ret = 2;
        }
        if (widget.listIds.isNotEmpty) {
          if (Qrcodess.length == nb) {
            Timer(Duration(seconds: 2), () {
              passClient();
            });
          }
        }
        if (widget.listIds.isEmpty) {
          if (Qrcodess.length == nb) {
            navTourComplet();
          }
        }
        //nb++;
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  int TestQr1(String Qr, int i) {
    if (data[i]['Qrcode'].contains(Qr) && Qr != "-1") {
      if (Qrcodess.contains(Qr)) {
        if (!codesUsed.contains(Qr)) {
          codesUsed.add(Qr);
          nb++;
          ret = 0;
        }
        ret = 0;
        return 1;
      }
    }
    return 0;
  }

  @override
  void initState() {
    super.initState();
    this.getPharmacie();
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
              'assets/images/logo.jpg',
              width: 74,
              height: 74,
              fit: BoxFit.fill,
            ),
          ],
        ),
        title: Text(
          widget.nom,
          style: FlutterFlowTheme.of(context).bodyText1.override(
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
        child: Stack(
          children: [
            Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 12, 0, 12),
                            child: Text(
                              Qrcodess.length.toString() + ' packages',
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(-0.05, 0.4),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: FlutterFlowIconButton(
                                  borderColor: Color(0xFF81D4FA),
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 200,
                                  fillColor: Color(0xFFFFF9F9),
                                  icon: Icon(
                                    Icons.qr_code_scanner_sharp,
                                    color: Color(0xFF81D4FA),
                                    size: 150,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
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
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    ListTile(
                                      leading: FaIcon(
                                        FontAwesomeIcons.box,
                                      ),
                                      title: Text(
                                        'Colis # ' +
                                            codesUsed.length.toString() +
                                            '/' +
                                            Qrcodess.length.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .title3
                                            .override(
                                              fontFamily: 'PT Serif',
                                              color: Color.fromARGB(
                                                  255, 114, 146, 158),
                                            ),
                                      ),
                                      trailing: Icon(
                                        Icons.check_circle,
                                        color: Qrcodess.length > nb
                                            ? Color.fromARGB(255, 154, 156, 154)
                                            : Color(0xFF24711E),
                                        size: 20,
                                      ),
                                      tileColor:
                                          Color.fromARGB(255, 231, 230, 236),
                                      dense: false,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () => scanQR(),
                    text: 'Scanner',
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

  void NavError(String Qr) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ErrorScanWidget(code: Qr),
      ),
    );
    //  nb = ret;
  }

  void passClient() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailClientsWidget(
          lista: ids,
        ),
      ),
    );
  }

  void navTourComplet() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListTourneeWidget(),
      ),
    );
  }
}
