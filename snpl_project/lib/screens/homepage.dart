// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:snpl_project/screens/pay.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('SNPL'),
      ),
      body: Center(
        child: Column(
          children: [
            Wrap(
              children: [
                SizedBox(width: 20),
                ElevatedButton(
                  child: Text('Scan'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return _buildQrView(context);
                    }));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
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