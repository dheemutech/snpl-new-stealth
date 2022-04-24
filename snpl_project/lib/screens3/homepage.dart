// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../screen4/pay.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  String qrcode = ' ';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xff271D5F),
            body: Column(
              children: [
                Container(
                  width: size.width,
                  height: 200,
                  color: Color(0xff0e7c7b),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.08,
                      ),
                      Text(
                        'You have a credit limit of',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.currency_rupee,
                            color: Colors.white,
                            size: 38,
                          ),
                          Text('500',
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                ElevatedButton(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.qr_code_scanner,
                        size: 35,
                        color: Color(0xffb10f2e),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Scan and Pay',
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff2C4D8D),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return _buildQrView(context);
                      }));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    elevation: 10,
                    primary: Color(0xff38C1FF),
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.1,
                        vertical: size.height * 0.02),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('TRANSACTION')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Column(
                          children: [
                            Center(
                              child: Text(
                                'Recent Transactions',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Color(0xff31081f),
                                  borderRadius: BorderRadius.circular(15)),
                              child: ListView(
                                padding: EdgeInsets.all(10),
                                shrinkWrap: true,
                                children: snapshot.data!.docs.map((document) {
                                  return Column(
                                    children: [
                                      Row(children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text(
                                            document['vpa'],
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white60,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            Text(
                                              'Rs ',
                                              style: TextStyle(
                                                  color: Colors.yellow,
                                                  fontSize: 25),
                                            ),
                                            Text(
                                              document['payment'].toString(),
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.yellow,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ]),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            )));
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 300.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.blue,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    int i = 0;
    late String vpa;
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        vpa = scanData.code!.toString().substring(
            scanData.code!.toString().indexOf('pa=') + 3,
            scanData.code!.toString().indexOf('pn=') - 1);
      });
      if (i == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PayPage(vpa: vpa)),
        );
      }
      i += 1;
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
