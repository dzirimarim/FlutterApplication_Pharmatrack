import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:pharma_track/scan_charge/scan_charge_widget.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class ErrorScanWidget extends StatefulWidget {
  final String code;
  final List codeReq;
  const ErrorScanWidget({Key key, this.code, this.codeReq}) : super(key: key);

  @override
  _ErrorScanWidgetState createState() => _ErrorScanWidgetState();
}

class _ErrorScanWidgetState extends State<ErrorScanWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  int nb = 0;
  String code1;
  Future<void> scanQR() async {
    String barcodeScanRes = "-1";
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', false, ScanMode.QR);
      if (barcodeScanRes != "-1") {
        if (widget.code != barcodeScanRes) {
          NavError();
        } else if (widget.code == barcodeScanRes) {
          NavSucc();
        }
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
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
          'Code erroné ',
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: 'PT Serif',
                color: Color(0xFF323D70),
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color.fromARGB(255, 189, 193, 195),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFFF4F4F4),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.sd_card_alert_rounded,
                                    color: Color(0xFFDF2A2A),
                                    size: 30,
                                  ),
                                  onPressed: () => scanQR(),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.55, 0),
                                  child: Text(
                                    'Colis non conforme \nMerci de scanner le colis\nautre fois pour confirmer l\'annulation',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'PT Serif',
                                          color:
                                              Color.fromARGB(255, 13, 28, 34),
                                        ),
                                  ),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 260,
                  icon: Icon(
                    Icons.qr_code_scanner,
                    color: Colors.black,
                    size: 100,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 200, 0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFFEB3333),
                  ),
                  child: FFButtonWidget(
                    onPressed: () => scanQR(),
                    text: 'Scan',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: Color(0xFFDF2A2A),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  void NavError() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ErrorScanWidget(code: widget.code),
      ),
    );
  }

  void NavSucc() async {
    //Navigator.pop(context, true);
    await Navigator.pop(context);
  }
}
