// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../screen4/pay.dart';
import '../services/database.dart';

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
  String creditLeft = "";
  @override
  void initState() {
    super.initState();
    setCreditLeft();
  }

  void setCreditLeft() async {
    creditLeft = await Database.fetchCredit();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xffFFFFFF),
            body: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(-0.02, -0.9),
                  child: Image(
                    image: AssetImage('card.png'),
                    height: size.height * 0.3,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.3, -0.6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.currency_rupee,
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(creditLeft,
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.03, -0.23),
                  child: ElevatedButton(
                    child: Text(
                      'Scan And Pay Now',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xffffffff),
                      ),
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
                      //elevation: 10,
                      primary: Color(0xff3C80FF),
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.07,
                          vertical: size.height * 0.02),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.83, -0.05),
                  child: Text(
                    'Recent Transactions',
                    style: TextStyle(
                      color: Color(0XFF3C80FF),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.14, 0.4),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('TRANSACTION')
                        .where('user_id', isEqualTo: Database.currentUser.id)
                        .orderBy('date_time', descending: true)
                        .limit(5)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView(
                          padding: EdgeInsets.all(10),
                          shrinkWrap: true,
                          children: snapshot.data!.docs.map((document) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 8,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 12),
                                  child: Column(
                                    children: [
                                      Row(children: [
                                        Icon(
                                          Icons.account_circle_outlined,
                                          color: Color(0xff3C80FF),
                                          size: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          document['payee_name'].split(' ')[0],
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Color(0xff3C80FF),
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Spacer(),
                                        Text(
                                          '₹${document['payment'].toString()}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xff3C80FF),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
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
