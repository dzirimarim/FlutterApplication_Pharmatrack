import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pharma_track/Detail_client/Detail_clients_widget.dart';
import 'package:pharma_track/detail_tournee/detail_tournee_widget.dart';
import 'package:pharma_track/error_scan/error_scan_widget.dart';
import '../Model/PharmacieModel.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;

class ScanChargeWidget extends StatefulWidget {
  final idt;
  const ScanChargeWidget({Key key, this.idt}) : super(key: key);

  @override
  _ScanChargeWidgetState createState() => _ScanChargeWidgetState();
}

class _ScanChargeWidgetState extends State<ScanChargeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  int packTot = 0;
  int nbPhar = 0;
  List Qrcodes = [];
  int id;
  List values = [];
  List ids = [];

  Future<int> nbcolisTot() async {
    final response = await http.get(Uri.parse(
        'http://192.168.43.71:8080/api/tour/nbColis?id=' +
            widget.idt.toString()));

    setState(() => packTot = json.decode(response.body));
    final response3 = await http.get(Uri.parse(
        'http://192.168.43.71:8080/api/tour/QrColisAll?idt=' +
            widget.idt.toString()));

    setState(() => Qrcodes = json.decode(response3.body));
    final response2 = await http.get(Uri.parse(
        'http://192.168.43.71:8080/api/tour/pharms?id=' +
            widget.idt.toString()));

    setState(() => values = json.decode(response2.body));
    if (values.length > 1) {
      for (int i = 0; i < values.length; i++) {
        final response4 = await http.get(Uri.parse(
            'http://192.168.43.71:8080/api/tour/QrColis?idt=' +
                widget.idt.toString() +
                '&idp=' +
                values[i]['id'].toString()));
        setState(() => lista = json.decode(response4.body));
        setState(() => listaPha.insert(i, lista));
        ids.add(values[i]['id']);
      }
    }
    nbPhar = values.length;
    packTot = Qrcodes.length;
    if (userSearchItems.length == packTot) {
      Timer(Duration(seconds: 2), () {
        passClient();
      });
      //ret = 0;
    }
    return packTot;
  }

  String _scanBarcode = "Aucun colis n'est scanné";
  int nb = 0;
  int s = 0;
  int ret = 0;
  int idPhar;
  int deja = 0;
  List userSearchItems = [];
  Future<void> scanQR() async {
    String barcodeScanRes = "-1";
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (barcodeScanRes != "-1") {
        if (TestQr1(barcodeScanRes) == 1) {
          ret = 0;
          if (!userSearchItems.contains(barcodeScanRes)) {
            userSearchItems.add(barcodeScanRes);
            nb++;
          } else {
            ret = 2;
          }
        }
        if (nb == packTot - 1) {
          Timer(Duration(seconds: 2), () {
            passClient();
          });
          //ret = 0;
        }
        if (TestQr1(barcodeScanRes) == 0) {
          NavError(barcodeScanRes);
        }
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
//barcode scanner flutter ant
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  List listaPha = [];
  List lista = [];

  int TestQr1(String Qr) {
    if (Qrcodes.length > 0) {
      if (Qrcodes.contains(Qr) && Qr != "-1") {
        return 1;
      }
    }
    return 0;
  }

  int NbScanParPhar(int i) {
    int nbr = 0;
    if (userSearchItems.length > 0) {
      for (var k = 0; k < userSearchItems.length; k++) {
        if (listaPha[i].contains(userSearchItems[k]) && listaPha.length > 0) {
          nbr++;
        }
      }
    }
    return nbr;
  }

  @override
  void initState() {
    super.initState();
    this.nbcolisTot();
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
          'Charger les packages',
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
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: Color(0xFF323D70),
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(-0.05, 0.4),
                          child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image.asset(
                                      'assets/images/scanQr.png',
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                  Center(
                      child: Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: ListTile(
                        title: Text(
                          "Nombre de packages total " +
                              " : " +
                              Qrcodes.length.toString(),
                          style: FlutterFlowTheme.of(context).subtitle2,
                        ),
                        dense: false,
                      ),
                    ),
                  )),
                  for (int c = 0; c < values.length; c++)
                    ListTile(
                      leading: NbScanParPhar(c) < listaPha[c].length
                          ? Icon(
                              Icons.person_outline,
                            )
                          : Icon(
                              Icons.person,
                              color: Color(0xFFE7600A),
                            ),
                      // selectedTileColor: Colors.grey[300],
                      title: Text(
                        values[c]['nomPharmacie'] +
                            " : " +
                            NbScanParPhar(c).toString() +
                            " / " +
                            listaPha[c].length.toString(),
                        style: FlutterFlowTheme.of(context).subtitle2,
                      ),
                      trailing: Icon(
                        Icons.check,
                        color: NbScanParPhar(c) < listaPha[c].length
                            ? Color.fromARGB(255, 68, 64, 64)
                            : Color(0xFFE7600A),
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                ],
              ),
            ),
          ),
        ],
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

  void NavError(String qr) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ErrorScanWidget(
          code: qr,
        ),
      ),
    );
    ret = 0;
    // nb = ret;
  }

  void passClient() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailClientsWidget(lista: ids, idt: widget.idt),
      ),
    );
  }
/*
  void _showAlert(BuildContext context, int ret) {
    if (ret == 0 && deja == 0) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
              child: Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0)),
                  child: Stack(
                    overflow: Overflow.visible,
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 120,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 30, 10, 1),
                          child: Column(
                            children: [
                              Text(
                                'Il vous reste ' +
                                    (packTot - nb - 1).toString() +
                                    ' packages à scanner \n',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'PT Serif',
                                      color: Color.fromARGB(255, 180, 213, 226),
                                      fontSize: 14,
                                    ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                color: Color(0xFFE7600A),
                                child: Text(
                                  'Ok',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: -35,
                          child: CircleAvatar(
                            backgroundColor: Color(0xFFE7600A),
                            radius: 30,
                            child: Icon(
                              Icons.error_outline,
                              color: Colors.white,
                              size: 30,
                            ),
                          )),
                    ],
                  )));
        },
      );
    }
  }*/
}
